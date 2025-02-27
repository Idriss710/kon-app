import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/profile_editing_pages/edit_education.dart';
import 'package:kon/widgets/profile_screen_section/about.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo.dart';
import 'package:kon/widgets/profile_screen_section/education_and_certifications.dart';
import 'package:kon/widgets/profile_screen_section/name_title_edit_button.dart';
import 'package:kon/widgets/profile_screen_section/skills.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.green,
                floating: false,
                pinned: false,
                snap: false,
                expandedHeight: 56.0,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // //////////////////////////////// Cover And Photo Section //////////////////////////////
                  
                  const CoverAndPhoto(),

                  // //////////////////////////////// Name Title And Edit Button Section //////////////////////////////

                  NameTitleAndEditButton(),
                  Container(height: 5, color: Colors.green[100]),
                  const SizedBox(height: 20),
                  About(),
                  const SizedBox(height: 16),
                  Container(height: 5, color: Colors.green[100]),

                  // //////////////////////////////// Education Section //////////////////////////////

                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/book.png',
                              width: 40,
                              height: 40,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              'Education',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.off(EditEducation());
                              },
                              icon: Icon(Icons.add, color: Colors.green),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        EducationAndCertifications(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(height: 5, color: Colors.green[100]),

                  //////////////////////////////// Skills Section //////////////////////////////
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/skills.png', width: 40, height: 40),
                            SizedBox(width: 10),
                            const Text('Skills',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  // Get.off(EditSkills());
                                },
                                icon: const Icon(Icons.edit, color: Colors.green))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Skills()
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(height: 5, color: Colors.green[100]),

                  // ///////////////////////////////// Experience Section /////////////////////////
                  // const SizedBox(height: 20),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Image.asset('assets/images/experience.png', width: 40, height: 40, color: Colors.black),
                  //           SizedBox(width: 10),
                  //           const Text('Experience',
                  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //           Spacer(),
                  //           IconButton(
                  //               onPressed: () {},
                  //               icon: Icon(Icons.edit, color: Colors.green))
                  //         ],
                  //       ),
                  //       SizedBox(height: 10),
                  //       // Experience(),
                  //       SizedBox(height: 20),
                  //     ],
                  //   ),
                  // ),
                  // Container(height: 5, color: Colors.green[100]),

                  // ///////////////////////////////// My Posts Section /////////////////////////
                  // const SizedBox(height: 20),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Image.asset('assets/images/experience.png', width: 40, height: 40, color: Colors.black),
                  //           SizedBox(width: 10),
                  //           const Text('My Posts',
                  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //           Spacer(),
                  //           IconButton(
                  //               onPressed: () {},
                  //               icon: Icon(Icons.edit, color: Colors.green))
                  //         ],
                  //       ),
                  //       SizedBox(height: 10),
                  //       // MyPosts(),
                  //       SizedBox(height: 20),
                  //     ],
                  //   ),
                  // ),
                  // ///////////////////////////////// My Posts Section /////////////////////////
                  // Container(height: 5, color: Colors.green[100]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
