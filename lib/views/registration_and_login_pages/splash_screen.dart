import 'package:flutter/material.dart';
import 'package:kon/views/home_scren.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=> HomeScreen())
      );
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