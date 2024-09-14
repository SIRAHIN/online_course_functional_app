import 'package:flutter/material.dart';
import 'package:onlinecourse_ui/pages/home_page.dart';
import 'package:onlinecourse_ui/utils/colors.dart';
import 'package:onlinecourse_ui/utils/textSize.dart';

import '../widgets/custome_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .02,
          ),
          Image.asset(
            "assets/images/logo.png",
            height: size.height * .4,
            width: size.width,
            alignment: Alignment.center,
          ),
          Container(
            height: size.height * .45,
            width: size.width * .90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(22.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      "Discover your next skill \nLearn anything you want",
                      style: primaryText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                     Text(
                      "Discover the things you wnat to \nLearn and grow with them",
                      style: secondaryText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                customBtn(
                  size: size,
                  text: "Get Started",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
