// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kon/views/single_course_page.dart';
// import 'package:kon/widgets/custom_widgets/custom_button.dart';
// import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
// import 'package:kon/widgets/profile_screen_section/cover_photo_for_course.dart';

// class CustomServiceCardCategory extends StatefulWidget {
//   const CustomServiceCardCategory({super.key});

//   @override
//   State<CustomServiceCardCategory> createState() =>
//       _CustomServiceCardCategoryState();
// }

// class _CustomServiceCardCategoryState extends State<CustomServiceCardCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: [
//         Column(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               // height: ,
//               child: Container(
//                   margin:
//                       EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
//                   padding: EdgeInsets.all(15),
//                   // width: MediaQuery.of(context).size.width,
//                   // height: 200,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/konnn.png')),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.green,
//                           blurRadius: 6,
//                           offset: Offset(3, 3))
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         // height: 120,
//                         child: Center(
//                           child: Text('data'),
//                         ),
//                       ),
//                       ///////////////// row for two button View and Invite
//                       Container(
//                         // width: MediaQuery.of(context).size.width/2,
//                         child: CustomButton(
//                           text: "View Service Details",
//                           onPressed: () {
//                             Get.to(SingleCoursePage());
//                           },
//                           backgroundColor: Colors.green,
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imageUrl;
  final String? imageAsset;
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;

  const CustomCard({
    Key? key,
    this.imageUrl,
    this.imageAsset,
    required this.child,
    this.height = 200,
    this.width = double.infinity,
    this.borderRadius = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          // image: NetworkImage(imageUrl),
          image: AssetImage('assets/images/konnn.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.black.withOpacity(0.3), // Overlay effect
          child: child,
        ),
      ),
    );
  }
}
