import 'package:flutter/material.dart';
import 'package:onlinecourse_ui/pages/navBar/course_details.dart';

import '../utils/colors.dart';
import '../utils/textSize.dart';

class catagoryCardWidget extends StatelessWidget {
  const catagoryCardWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CourseDetails(titleText: data["courseName"]);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: primaryColor.withOpacity(.3),
            offset: const Offset(0, 10),
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "${data["courseImage"]}",
                height: 120,
                width: 120,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data["courseName"]}",
                  style: primaryText,
                ),
                Text("${data["totalCourse"]} Courses"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
