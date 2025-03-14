// import 'package:flutter/material.dart';

// class CustomSidebar extends StatelessWidget {
//   final VoidCallback onClose;

//   const CustomSidebar({Key? key, required this.onClose}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 250,
//       color: Colors.blue,
//       child: Column(
//         children: [
//           SizedBox(height: 50),
//           // buildHeader(),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.white),
//             title: Text("Home", style: TextStyle(color: Colors.white)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(Icons.settings, color: Colors.white),
//             title: Text("Settings", style: TextStyle(color: Colors.white)),
//             onTap: () {},
//           ),
//           Spacer(),
//           ListTile(
//             leading: Icon(Icons.close, color: Colors.white),
//             title: Text("Close", style: TextStyle(color: Colors.white)),
//             onTap: onClose, // Call the function to close Customsidebar
//           ),
//         ],
//       ),
//     );
//   }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';

class CustomSidebar extends StatelessWidget {
  final VoidCallback onClose;

  const CustomSidebar({super.key, required this.onClose});

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
          child: Column(
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
              Text('Ali Omer',style: TextStyle(fontSize: 28,color: Colors.white)),
              //////// Email  ////////////////
              Text('aliomer@gmail.com',style: TextStyle(fontSize: 16,color: Colors.white),),
              
            ],
          ),
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





