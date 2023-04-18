import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

late Size mediaquery;

// ignore: camel_case_types, must_be_immutable
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
    mediaquery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: mediaquery.width * .025,
          left: mediaquery.width * .035,
          right: mediaquery.width * .035),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTab,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(mediaquery.width * 03),
          ),
        ]),
        child: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mediaquery.width * 03),
                color: Colors.blue[100]),
            padding: EdgeInsets.all(mediaquery.width * .048),
            child: SizedBox(
                width: mediaquery.width * 3,
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
