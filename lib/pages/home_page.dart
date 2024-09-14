import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlinecourse_ui/data/course_data.dart';
import 'package:onlinecourse_ui/utils/colors.dart';
import 'package:onlinecourse_ui/utils/textSize.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/grid_catagories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int indexOfNavBar = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics()),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: widgetSize.height * .3,
                width: double.infinity,
                decoration: const BoxDecoration(
                    //color: primaryColor,
                    gradient: LinearGradient(
                        colors: [primaryColor, Colors.indigo],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: appBarWidget(widgetSize: widgetSize),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explor Catagories",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GridView.builder(
                      // physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 9.0,
                              crossAxisSpacing: 9.0,
                              childAspectRatio: .9),
                      itemBuilder: (context, index) {
                        final data = listOfCourse[index];
                        return catagoryCardWidget(data: data);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexOfNavBar,
          onTap: (value) {
            setState(() {
              indexOfNavBar = value;
            });
          },
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.star_sharp),
                icon: Icon(
                  Icons.star_border_rounded,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.play_circle),
              icon: Icon(
                Icons.play_circle_outline_rounded,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(
                  Icons.favorite_outline_rounded,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings),
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: "Home"),
          ],
        ),
      ),
    );
  }
}



