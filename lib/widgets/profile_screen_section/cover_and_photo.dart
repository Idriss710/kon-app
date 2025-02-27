import 'package:flutter/material.dart';

class CoverAndPhoto extends StatefulWidget {
  const CoverAndPhoto({super.key});

  @override
  State<CoverAndPhoto> createState() => CoveroAndPhotoState();
}

class CoveroAndPhotoState extends State<CoverAndPhoto> {
  final double coverHeight = 200;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight /2 ;
    final double bottom = profileHeight/1.8 ;

    return  Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: builCoverPhoto()),
          Positioned(
            top: top,
            child: builProfilePhoto()), 
            
        ],
      ),
    );
  }

  Widget builCoverPhoto()=> Container(
    color: Colors.grey,
    // Image.network()
    child: Image.asset("assets/images/coverImage.jpg",width: MediaQuery.of(context).size.width,
    height: coverHeight,fit: BoxFit.cover,),
    
  );

  /// create ProfilePhoto
  Widget builProfilePhoto()=> Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(profileHeight / 2)

    ),
    child: CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      // NetworkImage()
      backgroundImage: AssetImage("assets/images/profileImage.jpg"),
      
    ),
  );
}

// import 'package:flutter/material.dart';

// class TitleAndPhoto extends StatelessWidget {
//   final String coverPhotoUrl;
//   final String profilePhotoUrl;

//   const TitleAndPhoto({super.key, required this.coverPhotoUrl, required this.profilePhotoUrl,});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             // Cover photo 
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage(coverPhotoUrl),fit: BoxFit.cover)
//               ),
//             )  ,
//             // profile photo
//             Positioned(
//               bottom: -50,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.white,
//                 child: CircleAvatar(
//                   radius: 55,
//                   backgroundImage: AssetImage(profilePhotoUrl),
//                 ),
//               ))
//           ],
//         ),
//         SizedBox(height: 60,),
//         Text('ali omer',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
//         ,Text('Flutter Developer',style: TextStyle(fontSize: 16 , color: Colors.grey[600]),),
//         SizedBox(height: 20,),
//         ElevatedButton(onPressed: () {
          
//         }, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800],shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))) ,child: Text('Edit profile'))
//       ],
//     );
//   }
// }