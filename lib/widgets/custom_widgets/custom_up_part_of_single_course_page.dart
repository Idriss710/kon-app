import 'package:flutter/material.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';
import 'package:kon/widgets/profile_screen_section/cover_photo_for_course.dart';

class CustomUpPartOfSingleCoursePage extends StatelessWidget {
  const CustomUpPartOfSingleCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverPhotoForCourse(),
        ///////////////// Group Name, Members and Description //////////////////////////
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Course Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '20 Videos',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Text(
                'Course Description:',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const CustomExpandableText(
                text:
                    'This Course for learning developing mobile applications with flutter, for lkjlkj dfl asdf dfkj sdf kljdsff',
                maxLines: 1,
                style: TextStyle(fontSize: 14),
              ),
              CustomButton(
                  text: 'Edit Course Profile',
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: Colors.green,
                  trailingIcon: Icons.edit,
                  )
                  
            ],
          ),
        ),
        Container(height: 5, color: Colors.green[100]),
      ],
    );
  }
}
