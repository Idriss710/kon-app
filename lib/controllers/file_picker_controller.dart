import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class FilePickerController extends GetxController {

  final supabase = Supabase.instance.client;

  final Rx<File?> selectedSingleImage = Rx<File?>(null);
  final RxString  pickerError = ''.obs;

  final RxBool isUploading = false.obs;
  final RxString uploadError = ''.obs;
  final RxString imageUrl = ''.obs;


  Future<void> pickImage() async {

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true
      ) ;

      if (result != null) {
        final file = File(result.files.single.path!);
        selectedSingleImage.value = file;
        pickerError.value = '';
      }
    } catch (e) {
      pickerError.value = 'Error picking file: ${e.toString()}';
      selectedSingleImage.value = null;
    }

  Future<void> uploadImage() async {

    try {
      // final result = await supabase.storage.from('avatars').upload(path, file)
    } catch (e) {
      
    }
  }

  void restUploadState(){
    uploadError.value = '';
    imageUrl.value = '';
  }

  void clearImage(){
    selectedSingleImage.value = null;
    restUploadState();
  }
  }
  // var selectedVideos = <String>[].obs;
  // RxList<String> selectedSingleImagePath = <String>[].obs;
  // Rx<Uint8List?> imageBytes  = Rx<Uint8List?>(null);
  // RxString fileName = ''.obs;

  // ///////////////////////////// Pick videos ////////////////////////////////////
  // Future<void> pickVideos() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.video,
  //     allowMultiple: true,
  //   );

  //   if (result != null) {
  //     selectedVideos.value = result.files.map((file) => file.path!).toList();
  //     Get.snackbar("selected", "${selectedVideos.length} video(s) selected",
  //         snackPosition: SnackPosition.BOTTOM);
  //   } else {
  //     Get.snackbar("Canceled", "there is no video selected.", snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
  
  // ///////////////////////////// Pick videos ////////////////////////////////////
  // Future<void> pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     withData: true
  //     // allowMultiple: true,
  //   );

  //   if (result != null && result.files.isNotEmpty) {
  //     final userId = supabase.auth.currentUser!.id;

  //     final file = result.files.first;
  //     imageBytes.value = file.bytes;
  //     fileName.value = '/$userId/avatar';
  //     // fileName.value = '${DateTime.now().millisecondsSinceEpoch}_${p.basename(file.name)}';

  //     int fileSize = file.bytes!.lengthInBytes ;
  //     print('ssssiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiz');
  //     print(fileSize);
  //     if (fileSize > 2 * 1024 * 1024) {

  //       Get.snackbar('Alert', 'image uploaded larg than 2 isss (${(fileSize / (1024 * 1024)).toStringAsFixed(2)} MB)',
  //                     snackPosition: SnackPosition.BOTTOM);
  //     }else {
  //       Get.snackbar('Done', 'image uploaded size is (${(fileSize / 1024).toStringAsFixed(2)} KB)',
  //                     snackPosition: SnackPosition.BOTTOM);
        
  //     }

  //       print('ssssssssssssssseeeeeeeeeeeeeeeekllllected image is path is \n');
  //     print(file);
  //     Get.snackbar("selected", "1 image selected",
  //         snackPosition: SnackPosition.BOTTOM);
  //   } else {
  //     Get.snackbar("Canceled", "there is no image selected.", snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
  // ///////////////////////////// Pick videos ////////////////////////////////////

  // Future<void> uploadImage()async{
    
  //   if (imageBytes.value == null || fileName.value.isEmpty)
  //     return;

  //   try {
  //     await supabase.storage.from('avatars').uploadBinary(fileName.value, imageBytes.value!,
  //     fileOptions: const FileOptions(
  //       upsert: true,
  //       contentType: 'image/jpeg'
  //     ));
  //     Get.snackbar('Success', 'uploaded image is done');

  //   } catch (e) {
  //     print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj\n');
  //     print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj\n');
  //     print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj\n');
  //     print(e.toString());
  //     Get.snackbar("failed", e.toString(), snackPosition: SnackPosition.BOTTOM);
      
  //   }
  // }
}
