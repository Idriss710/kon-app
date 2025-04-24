import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/registration_and_login/auth_controller.dart';
import 'package:kon/views/home_scren.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';
import 'package:kon/views/registration_and_login_pages/second_splash_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {

  final AuthController _authController = Get.put(AuthController());


  @override
  void initState() {
    super.initState();

////////////////////// check the loging status /////////////////////////////
    Future.delayed(Duration(seconds: 4),(){
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_)=> SecondSplashScreen())
      // );
    _authController.checkLoginStatus();

    });
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.transparent ,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              
              child: Image.asset("assets/images/konnn.png",width: 100,height: 100,fit: BoxFit.cover,),
            ),
            SizedBox(height: 50,),

            Text("Job Hunting ...",style: TextStyle(color: Colors.green,fontSize: 30, fontWeight: FontWeight.bold)),
            Lottie.asset('assets/animated/splash1.json',width: 200,height: 200)
          ],
        ) ,
      ),
    );
  }
}