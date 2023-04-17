import 'package:flutter/material.dart';
import 'package:online_note/button.dart';

import 'login.dart';

late Size mediaquery;

class dialogbox extends StatelessWidget {
  final controller;
  VoidCallback ontap;

  dialogbox({super.key, required this.controller, required this.ontap});

  @override
  Widget build(BuildContext context) {
    mediaquery = MediaQuery.of(context).size;
    return Dialog(
        child: SizedBox(
      height: mediaquery.height * .2,
      width: mediaquery.width * .15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaquery.height * .01,
          ),
          Padding(
            padding: EdgeInsets.only(left: mediaquery.width * .08),
            child: const Text(
              "Enter New Note",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaquery.height * .02,
          ),
          textfeild(
            name: "Note Title",
            condn: false,
            icon: Icons.add,
            controller: controller,
          ),
          SizedBox(
            height: mediaquery.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mybuttons(
                ontap: ontap,
              )
            ],
          )
        ],
      ),
    ));
    ;
  }
}
