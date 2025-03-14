import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/comment_page.dart';
import 'package:kon/views/single_group_page.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';

class CustomGroupCard extends StatefulWidget {
  const CustomGroupCard({super.key});

  @override
  State<CustomGroupCard> createState() => _CustomGroupCardState();
}

class _CustomGroupCardState extends State<CustomGroupCard> {
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
              color: Colors.black,
              blurRadius: 6,
              offset:Offset(2,2)
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////// Group Profile //////////////////////////
            ///
            CoverAndPhotoForGroup(),
            ///////////////// Group Name, Members and Description //////////////////////////

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: const Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Programmer Group",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1,295 Members',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Group Description:',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  CustomExpandableText(
                    text:
                        'this groub for accounting and management, for lkjlkj dfl asdf dfkj sdf kljdsff',
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
              text: "View",
              onPressed: () {
                Get.to(SingleGroupPage());
              },
              backgroundColor: Colors.green,
            ),
            CustomButton(
              text: "Invite",
              onPressed: () {},
              backgroundColor: Colors.green,
            ),
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
