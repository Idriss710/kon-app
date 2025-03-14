import 'package:flutter/material.dart';

class CoverAndPhotoForGroup extends StatefulWidget {
  const CoverAndPhotoForGroup({super.key});

  @override
  State<CoverAndPhotoForGroup> createState() => CoveroAndPhotoState();
}

class CoveroAndPhotoState extends State<CoverAndPhotoForGroup> {
  final double coverHeight = 200;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight /2 ;
    final double bottom = profileHeight/3 ;

    return  Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: builCoverPhoto()),
          Positioned(
            top: top,
            left: 20,
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
    
      radius: profileHeight / 2.5,
      backgroundColor: Colors.grey.shade800,
      // NetworkImage()
      backgroundImage: AssetImage("assets/images/profileImage.jpg"),
    ),
  );
}
