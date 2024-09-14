import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlinecourse_ui/data/course_details_data.dart';
import 'package:onlinecourse_ui/utils/colors.dart';
import 'package:onlinecourse_ui/utils/textSize.dart';
import 'package:onlinecourse_ui/widgets/custome_button.dart';
import 'package:video_player/video_player.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key, required this.titleText});

  final String titleText;

  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titleText,
            style: primaryText,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              flickManager.flickControlManager?.mute();
              Navigator.pop(context);
            },
            icon: const SizedBox(
              child: Icon(
                Icons.arrow_left,
                size: 35,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: FlickVideoPlayer(flickManager: flickManager),
                    ),
                    height: screenSize.height * .3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                              color: Colors.grey.withOpacity(0.8))
                        ]),
                  ),
                ),
                Text(
                  "$titleText essential Course material",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Created by",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      " Shehanul Islam Rahin",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_border_rounded),
                        Text(
                          " 4.3",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.watch_later_outlined),
                        Text(
                          " 25 hours",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "\$40",
                      style: primaryText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customBtn(
                      size: screenSize,
                      text: "Playlist(22)",
                      onTap: () {},
                    ),
                    customBtn(
                      textColor: primaryColor,
                      color: Colors.white,
                      size: screenSize,
                      text: "Description",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: courseDetailsdata.length,
                  itemBuilder: (context, index) {
                    final data = courseDetailsdata[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 14,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                      title: courseDetailsdata[index]["sectionName"] ==
                              "Introduction"
                          ? Text(
                              "${data["sectionName"]} $titleText",
                              style: listofCourseText,
                            )
                          : courseDetailsdata[index]["sectionName"] == "What is"
                              ? Text(
                                  "${data["sectionName"]} $titleText",
                                  style: listofCourseText,
                                )
                              : Text(
                                  "${data["sectionName"]}",
                                  style: listofCourseText,
                                ),
                      subtitle: Text(
                        data["time"],
                      ),
                      trailing: data["contentLock"]
                          ? const CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.lock,
                                color: Colors.orange,
                                size: 22,
                              ))
                          : const CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            customBtn(
              textColor: primaryColor,
              color: Colors.white,
              size: screenSize,
              text: "Enroll Now",
              onTap: () {},
            ),


            //  const SizedBox(
            //   width: 15,
            // ),

            FloatingActionButton(
              child: customBtn(
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                size: screenSize,
                onTap: () {},
              ),
              onPressed: () {},
            ),

           

            
          ],
        ),
      ),
    );
  }
}
