import 'package:get/get.dart';
import 'package:kon/models/profile.dart';
import 'package:kon/views/home_scren.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';
import 'package:kon/views/registration_and_login_pages/second_splash_screen.dart';
import 'package:kon/views/registration_and_login_pages/verification.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {

  final supabase = Supabase.instance.client;
  var isLoading = false.obs;
  var isLogin = false.obs;

  var email = ''.obs;
  var username = ''.obs;
  var full_name= ''.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  print('auth controller is caaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaalllllllllllllllllllllllledddddd');
  }

//////////////// sgin up function ///////////////////////////
  Future<void> signUp({
    required String userName ,
    required String userEmail ,
    required String password ,
                                }) async {
      isLoading.value = true ;
      email.value = userEmail;
      username.value = userName;
      try {
        final AuthResponse response = await supabase.auth.signUp(
          email: userEmail,
          password: password,
          // emailRedirectTo: 
          //   kIsWeb ? null : 'konapp://login',
          ) ;
          
          final user = response.user;


          
          /////// if registration failed 
          if (user == null) throw Exception('User Regisration failed');
          
          if (user != null) {
            Get.to(()=> VerificationScreen());
          }
          ////// if user is creation then create new profile
          ProfileModel newProfile = ProfileModel(username: userName);
          supabase.from('profiles')
                  .update(newProfile.toMap())
                  .eq('id', user.id);

          Get.snackbar('Success', 'User has been created');
      } catch (e) {
          Get.snackbar('fail', e.toString());
        
      }finally{
        isLoading.value = false ;
      }
     }
//////////////// login function ///////////////////////////
  Future<void> login({
    required String userEmail ,
    required String password ,
                                }) async {
      isLoading.value = true ;
      email.value = userEmail;
      try {
        final AuthResponse response = await supabase.auth.signInWithPassword(
          email: userEmail,
          password: password,
          // emailRedirectTo: 
          //   kIsWeb ? null : 'konapp://login',
          ) ;
          

          if (response != null) {
            Get.snackbar('Success', 'Login Successfully');
            Get.offAll(HomeScreen());
          }else{
            Get.snackbar('Failed', 'Login failed');
          }
          
          // /////// if registration failed 
          // if (user == null) throw Exception('User Regisration failed');

          // ////// if user is creation then create new profile
          // ProfileModel newProfile = ProfileModel(id: user.id, email: userEmail, password: password);
          // supabase.from('profiles')
          //         .insert(newProfile.toJson());

      } on AuthException catch (e) {
     Get.snackbar('fail', e.toString()); // Supabase-specific auth error
  } catch (e) {
     Get.snackbar('Unexpected error', e.toString());
  } finally{
        isLoading.value = false ;
      }

     }
//////////////// verify code function ///////////////////////////

Future<void> verifyCode(String code) async{
  try {
    final res = await supabase.auth.verifyOTP(
      type: OtpType.email,
      email: email.value,
      token: code
      );


      if (res.session != null) {

        Get.offAll(EditProfile());
      }else{
          Get.snackbar('Erorr', 'Code is Invalid');
      }
  } catch (e) {
    Get.snackbar('Erorr', e.toString());
  }
}

//////////////// resent code function ///////////////////////////

///
Future<void> resendVerificationCode() async {
  try {
    // Send the verification email again using Supabase
    final response = await supabase.auth.resend(
      type: OtpType.signup,
      email: email.value,      
    );

    if (response != null) {
      print('Error: ${response}');
    } else {
      print('Verification code resent to $email');
    }
  } catch (e) {
    print('Error: $e');
  }
}

//////////////// check the login session function ///////////////////////////

Future<void> checkLoginStatus() async{

  final session = await supabase.auth.currentSession;
print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaauuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuttttttttthhhhhhhhh');
  if (session != null) {

      Get.offAll(()=> HomeScreen());
      // Get.offAll(()=> VerificationScreen());

    }else{
      Get.to(()=> SecondSplashScreen());
    }
  }
   



//////////////// logout function ///////////////////////////


Future<void> logout()async{

    await supabase.auth.signOut();
    Get.offAll(LoginScreen());

}


}