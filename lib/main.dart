import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/views/registration_and_login_pages/forgot_password.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';
import 'package:kon/views/registration_and_login_pages/reset_password.dart';
import 'package:kon/views/registration_and_login_pages/second_splash_screen.dart';
import 'package:kon/views/registration_and_login_pages/rigester.dart';
import 'package:kon/views/registration_and_login_pages/splash_screen.dart';
import 'package:kon/views/registration_and_login_pages/verification.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,

));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
GetPage(name: "/" , page:()=>const SplashScreen() ),
GetPage(name: "/secondSplashScreen", page:()=> const SecondSplashScreen()),
GetPage(name: "/regisrationScreen", page:() => const RegistratoinScreen()),
GetPage(name: "/loginScreen", page: ()=> const LoginScreen()),
GetPage(name: "/forgotPasswordScreen", page:()=> const ForgotPasswordScreen()),
GetPage(name: "/verificationScreen", page: ()=>const VerificationScreen()),
GetPage(name: "/resetPasswordScreen", page:()=> const ResetPasswordScreen()),
GetPage(name: "/resetPasswordScreenn", page:()=> ProfileScreen())
      ],
    );
  }
}
