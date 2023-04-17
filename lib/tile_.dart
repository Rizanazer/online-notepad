import 'package:flutter/material.dart';

class tile_ extends StatelessWidget {
  final String taskname;
  Function()? ontap;
  tile_({super.key, required this.taskname, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: InkWell(
        onTap: ontap,
        // ignore: avoid_unnecessary_containers
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.blue[100]),
          padding: const EdgeInsets.all(24),
          child: Text(taskname),
        ),
      ),
    );
  }
}
