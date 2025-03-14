import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/single_course_page.dart';
import 'package:kon/views/single_service_page.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_screen_section/cover_photo_for_course.dart';

class CustomServiceCard extends StatefulWidget {

  const CustomServiceCard({super.key});

  @override
  State<CustomServiceCard> createState() => _CustomServiceCardState();
}

class _CustomServiceCardState extends State<CustomServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
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
            ///////////////// Service Name and  Price //////////////////////////

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Creating Web Application",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'Service Description:',
                  //   style: TextStyle(fontSize: 14, color: Colors.grey),
                  // ),
                  Text(
                    'Service Price:',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'Start From 50 Doular',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  // CustomExpandableText(
                  //   text:
                  //       'This Course for learning developing mobile applications with flutter, for lkjlkj dfl asdf dfkj sdf kljdsff',
                  //   maxLines: 1,
                  //   style: TextStyle(fontSize: 14),
                  // )
                ],
              ),
            ),
      ///////////////// row for two button View and Invite
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                text: "View Service Details",
                onPressed: () {
                  Get.to(SingleServicePage());
                },
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
          ],
        ),
      ),
    ]);
  }
}
