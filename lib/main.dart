import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/registration_and_login/auth_controller.dart';
import 'package:kon/views/home_scren.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/views/registration_and_login_pages/forgot_password.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';
import 'package:kon/views/registration_and_login_pages/reset_password.dart';
import 'package:kon/views/registration_and_login_pages/second_splash_screen.dart';
import 'package:kon/views/registration_and_login_pages/rigester.dart';
import 'package:kon/views/registration_and_login_pages/splash_screen.dart';
import 'package:kon/views/registration_and_login_pages/verification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async{

WidgetsFlutterBinding.ensureInitialized();

/////////////////// Supabase initialization ///////////////////
await Supabase.initialize(
   url: 'https://enekmjevltigpiixysub.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVuZWttamV2bHRpZ3BpaXh5c3ViIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMzNTM3OTEsImV4cCI6MjA1ODkyOTc5MX0.x8BOoS7onLaV_JQVRuuo-jpnuL26KJHt4pHGCz_VjPI',
);

SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.white,
  statusBarIconBrightness: Brightness.dark,

));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  // StreamSubscription? _sub;
  // final supabsae = Supabase.instance.client;
// 
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _handleIncomingLinks();
  // }

  // ///// function for handle the redirect url
  // void _handleIncomingLinks(){
  //   _sub = uriLinkStream.listen((Uri? uri){
  //     if (uri != null) {
  //       print('DEEEEEEEEEEEEE $uri');
  //       if (uri.host == 'login') {
  //         Get.to(LoginScreen());
  //       }
  //     }
  //   }, onError: (err){
  //     print('liiiiiiiiiiiiiiiiiiiiiink error $err');
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Get.put(AuthController()); // initialized here for check the login session

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
GetPage(name: "/resetPasswordScreenn", page:()=> ProfileScreen()),
GetPage(name: "/homeScreen", page:()=> HomeScreen()),
GetPage(name: "/profileScreen", page:()=> ProfileScreen())
      ],
    );
  }
}
