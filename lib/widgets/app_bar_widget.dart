import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textSize.dart';

class appBarWidget extends StatelessWidget {
  const appBarWidget({
    super.key,
    required this.widgetSize,
  });

  final Size widgetSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: titleText,
                ),
                Text(
                  "Good Morning",
                  style: subTitleText,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white.withOpacity(.4),
              child: Icon(
                Icons.notification_add,
                color: Colors.white,
              ),
            )
          ],
        ),
        const Spacer(),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                // border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: primaryColor,
                suffixIcon: Icon(Icons.mic_none_outlined),
                suffixIconColor: primaryColor,
                hintText: "Search Your Course..!",
                hintStyle: hintText,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
