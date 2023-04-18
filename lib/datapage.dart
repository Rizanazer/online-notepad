import 'package:flutter/material.dart';
import 'package:online_note/login.dart';

// ignore: camel_case_types
class dataPage extends StatelessWidget {
  const dataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("name"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Card(
              child:
                  textfeild(name: "type here", condn: false, icon: Icons.abc))
        ],
      ),
    );
  }
}
