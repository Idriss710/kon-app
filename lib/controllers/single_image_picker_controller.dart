import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
// import 'package:permission_handler/permission_handler.dart';

class SingleImagePickerController extends GetxController {
  RxList<Asset> images = <Asset>[].obs; // قائمة الصور كمصفوفة ملاحظة (Rx)
  RxString error = ''.obs; // نص الخطأ (مراقب)
  // RxBool permissionReady = false.obs; // حالة الأذونات

  // static const List<Permission> _permissions = [
  //   Permission.storage,
  //   Permission.photos,
  //   Permission.camera
  // ];

  // @override
  // void onInit() {
  //   super.onInit();
  //   _requestPermissions(); // طلب الأذونات عند بدء التشغيل
  // }

  // Future<void> _requestPermissions() async {
  //   final statuses = await _permissions.request();
  //   if (statuses.values.every((status) => status.isGranted)) {
  //     print('ssssssssssssssssssssssssssssssssssshhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhsssss1');
  //     permissionReady.value = true;
  //   }
  // }


  Future<void> pickImages(dynamic colorScheme) async {
    // if (permissionReady.value) {
    //   print(permissionReady);

    //   openAppSettings(); // فتح إعدادات التطبيق إذا لم تكن الأذونات ممنوحة
    //   return;
    // }

    try {
      List<Asset> resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        // iosOptions: IOSOptions(
        //   doneButton:
        //       UIBarButtonItem(title: 'Confirm', tintColor: colorScheme.primary),
        //   cancelButton:
        //       UIBarButtonItem(title: 'Cancel', tintColor: colorScheme.primary),
        //   albumButtonColor: colorScheme.primary,
        //   settings: iosSettings,
        // ),
        androidOptions: AndroidOptions(
          maxImages: 1,
          autoCloseOnSelectionLimit: true,
          actionBarColor: Colors.green,
          actionBarTitleColor: colorScheme.onSurface,
          statusBarColor: colorScheme.surface,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: colorScheme.primary,
          hasCameraInPickerPage: true,
        ),
      );

      images.assignAll(resultList); // تحديث القائمة مباشرة
    } catch (e) {
      error.value = e.toString();
    }
  }
}
