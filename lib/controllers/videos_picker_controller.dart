import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class VideoPickerController extends GetxController {
  var selectedVideos = <String>[].obs;

  /// Pick videos
  Future<void> pickVideos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );

    if (result != null) {
      selectedVideos.value = result.files.map((file) => file.path!).toList();
      Get.snackbar("selected", "${selectedVideos.length} video(s) selected",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Canceled", "there is no video selected.", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';

// class VideoPickerController extends GetxController {
//   var selectedVideos = <String>[].obs;
//   var isUploading = false.obs; // حالة التحميل

//   /// Pick videos
//   Future<void> pickVideos() async {
//     isUploading.value = true; // بدء التحميل
    
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       allowMultiple: true,
//     );

//     if (result != null) {
//       selectedVideos.value = result.files.map((file) => file.path!).toList();
//       Get.snackbar("Selected", "${selectedVideos.length} video(s) selected",
//           snackPosition: SnackPosition.BOTTOM);
//     } else {
//       Get.snackbar("Canceled", "There is no video selected.", snackPosition: SnackPosition.BOTTOM);
//     }
    
//     isUploading.value = false; // إنهاء التحميل
//   }
// }