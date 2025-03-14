import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_project.dart';

Widget projectCard(BuildContext context ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //////////////////////////////////////// project name  //////////////////////////////

      const Text(
        'Name Of The Project',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
     
      //////////////////////////////////////// date of project from to  //////////////////////////////

      Text('Jun 2017 - Nov 2019',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

      //////////////////////////////////////// project url //////////////////////////////

      Text('Verify at :', style: TextStyle(fontSize: 16, color: Colors.grey)),
      Text('www.projectUrl-sdf--sdfff.com'),
      //////////////////////////////////////// project description //////////////////////////////
      Text('Project Description :',
          style: TextStyle(fontSize: 16, color: Colors.grey)),
      CustomExpandableText(
          text:
              "My name is aymen I'm sofware developer , asdf sdfa  sdfsdlfkj lsd lfkj  sdfkljlkjsd flkjkj dsfkj lkdsf lkj ljsdflkjl dsflk jlsdfl kj"),

      //////////////////////////////////////// Eidt Button //////////////////////////////

      CustomButton(text: 'Edit', 
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.green,
      onPressed: () {
        Get.to(EditProjectPage());
      },
      ),

      Divider(
        color: const Color.fromARGB(255, 31, 30, 30),
      )
    ],
  );
}
