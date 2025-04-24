import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/bottom_nav_bar_page/single_chat-page.dart';
import 'package:kon/views/single_course_page.dart';
import 'package:kon/views/single_service_page.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/profile_screen_section/cover_photo_for_course.dart';

class CustomMessageCard extends StatefulWidget {

  const CustomMessageCard({super.key});

  @override
  State<CustomMessageCard> createState() => _CustomMessageCardState();
}

class _CustomMessageCardState extends State<CustomMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      InkWell(
        child: Container(
          child:             ////////////////// Photo And Name ///////////////////
        
              Row(
                ////////////////// Persone Photo ///////////////////
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profileImage.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ////////////////// Name and Date///////////////////
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Omer Ali',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '3h',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ////////////////// End Photo And Name ///////////////////,
        ),
      onTap: () {
        Get.to(singleChatPage());
      },
      ),
      
    ]);
  }
}
