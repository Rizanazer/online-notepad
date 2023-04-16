import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_note/getusername.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  List<String> DocId = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("user")
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshat) => snapshat.docs.forEach((document) {
              // ignore: avoid_print
              print(document.reference);
              DocId.add(document.reference.id);
            }));
  }

  final user = FirebaseAuth.instance.currentUser!;
  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(user.email!),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              signout();
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: DocId.length,
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  itemBuilder: (context, Index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.blue[100],
                        title: GetUserData(documentId: DocId[Index]),
                      ),
                    );
                  });
            },
          ))
        ]),
      ),
    );
  }
}
