import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/single_course_page.dart';
import 'package:kon/views/single_group_page.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_screen_section/cover_photo_for_course.dart';

class CustomCourseCard extends StatefulWidget {
  const CustomCourseCard({super.key});

  @override
  State<CustomCourseCard> createState() => _CustomCourseCardState();
}

class _CustomCourseCardState extends State<CustomCourseCard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        margin: EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 5),
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              blurRadius: 6,
              offset:Offset(3,3)
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            CoverPhotoForCourse(),
            ///////////////// Group Name, Members and Description //////////////////////////

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Programming Course",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '20 Videos',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Course Description:',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  CustomExpandableText(
                    text:
                        'This Course for learning developing mobile applications with flutter, for lkjlkj dfl asdf dfkj sdf kljdsff',
                    maxLines: 1,
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
      ///////////////// row for two button View and Invite
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              text: "View Videos List",
              onPressed: () {
                Get.to(SingleCoursePage());
              },
              backgroundColor: Colors.green,
            ),
            // CustomButton(
            //   text: "Invite",
            //   onPressed: () {},
            //   backgroundColor: Colors.green,
            // ),
          ],
        ),
      ),
          ],
        ),
      ),
      // Container(height: 5, color: Colors.green[100]),
    ]);
  }
}
