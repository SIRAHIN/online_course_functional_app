import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/textSize.dart';

class customBtn extends StatelessWidget {
  customBtn(
      {super.key,
      required this.size,
      this.text,
      required this.onTap,
      this.color,
      this.icon,
      this.textColor});

  final Size size;
  late String? text;
  final void Function()? onTap;
  final Color? color;
  final Icon? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              border: color == primaryColor ?  null : Border.all(color: primaryColor, width: 2),
              color: color ?? primaryColor,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          height: size.height * .07,
          width: size.width * .40,
          child: text != null
              ? Text(
                  text ?? " ",
                  style: textColor != null
                      ? TextStyle(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ComicNeue",
                        )
                      : btnText,
                )
              : icon),
    );
  }
}
