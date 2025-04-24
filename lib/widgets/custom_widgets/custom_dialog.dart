import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/bottom_nav_bar_page/single_chat-page.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_course.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_group.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_post.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_project.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_service.dart';

void CustomDialog(BuildContext context, String title, bool addPost, bool addService, bool addProject, bool addCourse, bool addGroup) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Center(child: Text(title)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            if(addPost)
            CustomButton(text: 'Add Post',icon: Icons.post_add,
            width: MediaQuery.of(context).size.width/2, 
            backgroundColor: Colors.green,
            onPressed: () {
              // Get.to(AddPostPage());
              Get.to(singleChatPage());
            }),
            // SizedBox(height: 10,),

            if(addService)
            CustomButton(text: 'Add Service',
            icon:Icons.design_services_outlined,
            width: MediaQuery.of(context).size.width/2, 
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.pop(context);
              Get.to(AddServicePage());
            }),
            // SizedBox(height: 10,),

            // if(addProject)
            // CustomButton(text: 'Add Project',icon:Icons.work,
            // width: MediaQuery.of(context).size.width/2, 
            // backgroundColor: Colors.green,
            // onPressed: () {
            //   Get.to(EditProjectPage());
            // }),
            // SizedBox(height: 10,),

            if(addCourse)
            CustomButton(text: 'Add Course',icon: Icons.school,
            width: MediaQuery.of(context).size.width/2,
            backgroundColor: Colors.green,
             onPressed: () {
              Get.to(AddCourse());
            }),
            
            if(addGroup)
            CustomButton(text: 'Add Group',icon: Icons.school,
            width: MediaQuery.of(context).size.width/2,
            backgroundColor: Colors.green,
             onPressed: () {
              Get.to(AddGroupPage());
            }),
          ],
        ),
      );
    },
  );
}
