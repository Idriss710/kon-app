import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_project.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';

class CustomUpPartOfSingleGroupPage extends StatelessWidget {
  const CustomUpPartOfSingleGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverAndPhotoForGroup(),
        ///////////////// Group Name, Members and Description //////////////////////////
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Group Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '1,295 Members',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Text(
                'Group Description:',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const CustomExpandableText(
                text:
                    'This group for accounting and management graduated only, for lkjlkj dfl asdf dfkj sdf kljdsff',
                maxLines: 1,
                style: TextStyle(fontSize: 14),
              ),
              CustomButton(
                  text: 'Edit Group Profile',
                  onPressed: () {
                     Get.to(EditProjectPage());
                  },
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: Colors.green,
                  trailingIcon: Icons.edit)
            ],
          ),
        ),
        Container(height: 5, color: Colors.green[100]),
      ],
    );
  }
}
