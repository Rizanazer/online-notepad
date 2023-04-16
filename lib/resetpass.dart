import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_note/login.dart';

// ignore: camel_case_types
class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

// ignore: camel_case_types
class _resetpasswordState extends State<resetpassword> {
  final emailcontroller = TextEditingController();
  String? errormessage = '';
  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future Forgetpassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("reset link send!!!"),
            );
          });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.message;
      });
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textfeild(
              name: "Backup Email",
              condn: false,
              icon: Icons.email,
              controller: emailcontroller,
            ),
            MaterialButton(
              onPressed: Forgetpassword,
              textColor: Colors.blue,
              child: const Text("Reset Password"),
            ),
            const SizedBox(
              height: 30,
            ),
            _errorMessage()
          ],
        ),
      ),
    );
  }
}
