import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/profile_controller.dart';
import 'package:kon/controllers/registration_and_login/auth_controller.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';

class CustomSidebar extends StatelessWidget {
  final VoidCallback onClose;

   CustomSidebar({super.key, required this.onClose});

  final AuthController authController = Get.put(AuthController());
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.white,
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
    );
  }
  Widget buildHeader(BuildContext context) => Material(
      color: Colors.green, 
    
    child: InkWell(
      onTap: () {
        Get.to(ProfileScreen());
      },
      child: Container(
        width: 250,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24
          ),
          child: Obx(() {
            return Column(
            children: [
               ClipOval(
                child: Image.asset(
                  'assets/images/profileImage.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12,),
              //////// Name  ////////////////
              Text("${_profileController.username}",style: TextStyle(fontSize: 28,color: Colors.white)),
              //////// Email  ////////////////
              Text('${_profileController.email}',style: TextStyle(fontSize: 16,color: Colors.white),),
              
            ],
          );
          },)
       ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 10, /// space between vertical Items.
    children: [
      ListTile(
        leading: const Icon(Icons.home_outlined,color: Colors.green,),
        title: Text('Home'),
        onTap: () {
          Get.to(ProfileScreen());
        },
      ),ListTile(
        leading: const Icon(Icons.notification_important_outlined,color: Colors.green,),
        title: Text('Notification'),
        onTap: () {
          
        },
      ),ListTile(
        leading: const Icon(Icons.settings_applications,color: Colors.green,),
        title: Text('Settings'),
        onTap: () {
         
        },
      ),ListTile(
        leading: const Icon(Icons.logout,color: Colors.green,),
        title: Text('Logout'),
        onTap: () {
           authController.logout();
          // Get.offAll(LoginScreen());
        },
      ),
      Divider(color: Colors.grey,),
     ListTile(
        leading: const Icon(Icons.close,color: Colors.green,),
        title: Text('Close'),
        onTap: onClose,
      ),
    ],
    ),
  );
}





