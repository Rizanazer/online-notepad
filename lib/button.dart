import 'package:flutter/material.dart';

class mybuttons extends StatelessWidget {
  VoidCallback? ontap;
  mybuttons({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ontap, child: const Text("ADD"));
  }
}
