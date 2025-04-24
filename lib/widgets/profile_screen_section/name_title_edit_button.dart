import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_profile.dart';

class NameTitleAndEditButton extends StatelessWidget {
  const NameTitleAndEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALI OMER',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    text: 'Edit',
                    onPressed: () {
                      Get.to(EditProfile());
                    },
                    width: MediaQuery.of(context).size.width / 2,
                    borderRadius: 20,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              );
  }
}