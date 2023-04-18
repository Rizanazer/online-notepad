import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class tile_ extends StatelessWidget {
  final String taskname;
  Function()? ontap;
  Function(BuildContext)? deleteTab;
  tile_(
      {super.key,
      required this.taskname,
      required this.ontap,
      required this.deleteTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTab,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(30),
          ),
        ]),
        child: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[100]),
            padding: const EdgeInsets.all(24),
            child: SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(taskname), const Icon(Icons.arrow_right)],
                )),
          ),
        ),
      ),
    );
  }
}
