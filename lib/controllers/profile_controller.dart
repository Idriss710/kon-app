import 'package:get/get.dart';
import 'package:kon/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {

  final supabase = Supabase.instance.client;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
          print('Profile controlllller issssssssssssssssssssssssssss called');

    loadProfile();
  }
  
  final username = ''.obs ;
  final email = ''.obs ;
  final fullName= ''.obs ;
  final specialization= ''.obs ;
  final avatarUrl= ''.obs ;



  Future<void> loadProfile() async{


      try {
        
      var user = supabase.auth.currentUser;

      if (user == null) return;

        final data = await supabase.from('profiles')
                              .select()
                              .eq('id', user.id)
                              .single();
     
      // Get.snackbar('Success', 'load profile is done');
      print('gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg');
      print(data);

      username.value = data['username'];
      username.value = data['specialization'];
      email.value = user.email!;

      } catch (e) {
      Get.snackbar('failll', e.toString());
    }
      
  }

  Future<void> updateProfile(
      { String? userName, String? fullName}) async {
    try {
      var user = await supabase.auth.currentUser;

      if (user == null) {
      Get.snackbar('Fial', 'user is not log in');
      } else {
        await supabase
            .from('profiles')
            .update(ProfileModel(username: 'yoooo').toMap())
            .eq('id', user.id);
      }

      Get.snackbar('Success', 'update is done');
    } catch (e) {
      Get.snackbar('fail', e.toString());
    }
  }
}
