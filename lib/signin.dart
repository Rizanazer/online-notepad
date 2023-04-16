import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_note/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController repassword = TextEditingController();
  String? errormessage = '';

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        errormessage == '' ? '' : 'Humm ? $errormessage',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  Future SignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      addUserDetails(username.text.trim()
          //int.parse(controller.text.trom()) => for integer
          );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

  Future addUserDetails(String name) async {
    await FirebaseFirestore.instance.collection('user').add({'Username': name});
  }

  // bool password_() {
  //   if (password.text.trim() == repassword.text.trim()) {
  //     return true;
  //   } else {
  //     return false;
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textfeild(
            name: "username",
            condn: false,
            controller: username,
            icon: Icons.account_circle,
          ),
          const SizedBox(
            height: 20,
          ),
          textfeild(
            name: "email",
            condn: false,
            controller: email,
            icon: Icons.email,
          ),
          const SizedBox(
            height: 20,
          ),
          textfeild(
            name: "password",
            condn: false,
            controller: password,
            icon: Icons.password_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          textfeild(
            name: "re-password",
            condn: true,
            controller: repassword,
            icon: Icons.password_outlined,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (email.text.isNotEmpty &&
                  username.text.isNotEmpty &&
                  password.text.isNotEmpty) {
                if (password.text.trim() == repassword.text.trim()) {
                  SignUp();
                  // Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Match Your Password!!")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fill your Info!!")));
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child:
                const SizedBox(width: 60, child: Center(child: Text("SignUp"))),
          ),
          const SizedBox(
            height: 10,
          ),
          _errorMessage()
        ],
      ),
    );
  }
}
