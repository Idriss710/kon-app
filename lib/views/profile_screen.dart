import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/profile_screen_widgets/about.dart';
import 'package:kon/widgets/profile_screen_widgets/cover_and_photo.dart';
import 'package:kon/widgets/profile_screen_widgets/name_title_edit_button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // custom PhotoAndTitle widget
              const CoverAndPhoto(),
              
              
              
              // Name nad Title

              NameTitleAndEditButton(),
              
              // // line for spreate
              Container(
                height: 5,
                color: Colors.green[100],
              ),

              
              ///////////////////// About Section ////////////////////////
              const SizedBox(
                height: 20,
              ),
              About(),
              const SizedBox(
                height: 16,
              ),
                /////////////////// End About section //////////////
              // line for spreate
              Container(
                height: 5,
                color: Colors.green[100],
              ),
              



            ],
          ),
        ),
      )),
    );
  }
}
