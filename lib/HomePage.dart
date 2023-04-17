// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_note/dialogbox.dart';
import 'package:online_note/login.dart';
import 'package:online_note/tile_.dart';

final usersRef = FirebaseFirestore.instance.collection('user');
late Size mediaquery;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  // List<String> DocId = [];
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection("user")
  //       .get()
  //       // ignore: avoid_function_literals_in_foreach_calls
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             // ignore: avoid_print
  //             print(document.reference);
  //             // DocId.add(document.reference.id);
  //             DocId.add(document.reference.id);
  //           }));
  // }
  TextEditingController newfield = TextEditingController();

  String? username;
  final user = FirebaseAuth.instance.currentUser!;
  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    final String? id = FirebaseAuth.instance.currentUser?.uid;
    final DocumentSnapshot doc = await usersRef.doc(id).get();
    setState(() {
      username = doc['Username'];
    });
  }

  //list view
  final List myTiles = ['A', 'B', 'C', 'D'];
  //reorder methord
  void updatemytile(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      final tile = myTiles.removeAt(oldIndex);
      myTiles.insert(newIndex, tile);
    });
  }

  //create new tile
  void createNewtile() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogbox(
            controller: newfield,
            ontap: addNewtile,
          );
        });
  }

  //add new tile
  void addNewtile() {
    setState(() {
      myTiles.add([newfield.text]);
      newfield.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, //shadow part line below appbar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username: ${username ?? ""}"),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(
                    text: "logined as: ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                    children: [
                  TextSpan(
                    text: user.email!,
                    style: const TextStyle(fontSize: 10),
                  )
                ]))
          ],
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
      body: ListView.builder(
        itemCount: myTiles.length,
        itemBuilder: (context, index) {
          return tile_(taskname: myTiles[index][0], ontap: () {});
        },
      ),
      // body: ReorderableListView(
      //   children: [
      //     for (final tile in myTiles)
      //       ListTile(
      //         key: ValueKey(tile),
      //         title: Text(tile),
      //       )
      //   ],
      //   onReorder: (oldIndex, newIndex) => updatemytile(oldIndex, newIndex),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtile,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//reminder
// body: SafeArea(
      //   child: Column(children: [
      //     // Expanded(
      //     //     child: FutureBuilder(
      //     //   future: getDocId(),
      //     //   builder: (context, snapshot) {
      //     //     return ListView.builder(
      //     //         itemCount: DocId.length,
      //     //         // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      //     //         itemBuilder: (context, Index) {
      //     //           return Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: ListTile(
      //     //               tileColor: Colors.blue[100],
      //     //               title: GetUserData(documentId: DocId[Index]),
      //     //             ),
      //     //           );
      //     //         });
      //     //   },
      //     // ))
      //   ]),
      // ),
 