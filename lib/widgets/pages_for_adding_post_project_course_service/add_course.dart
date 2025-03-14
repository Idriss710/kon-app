import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/image_picker_controller.dart';
import 'package:kon/controllers/videos_picker_controller.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final VideoPickerController videoPickerController =
      Get.put(VideoPickerController());

  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseDescriptionController =
      TextEditingController();
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  void _submitCourse(BuildContext context) {
    String courseName = courseNameController.text.trim();
    String courseDescription = courseDescriptionController.text.trim();

    if (courseName.isEmpty &&
        courseDescription.isEmpty &&
        imagePickerController.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something or add an image")),
      );
      return;
    }

    // إرسال البيانات إلى السيرفر أو معالجتها محليًا
    print("Post Text: $courseName");
    print("Post Text: $courseDescription");
    print("Selected Images: ${imagePickerController.images.length}");

    // إعادة تعيين البيانات
    courseNameController.clear();
    courseDescriptionController.clear();
    imagePickerController.images.clear();
    videoPickerController.selectedVideos.clear();

    Get.back(); // الرجوع إلى الصفحة السابقة
  }

  Widget _buildSingleImageView(BuildContext context) {
    return Obx(() {
      if (imagePickerController.images.isEmpty) {
        return const SizedBox(); // Return empty widget if the imagePickerController is null
      }
      Asset asset = imagePickerController.images.first;
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green, width: 3), // إطار بلون أخضر
        ),
        child: ClipOval(
          child: AssetThumb(
            asset: asset,
            width: 120,
            height: 120,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    courseNameController.dispose();
    courseDescriptionController.dispose();
    imagePickerController.dispose();
    videoPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
        actions: [
          TextButton(
            onPressed: () {
              _submitCourse(context);
            },
            child: Text(
              'Submit',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ///////////////////// Course Name //////////////////////
              Text(
                'Course Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomTextField(hintText: 'Course Name'),

              ///////////////////// Course Description //////////////////////
              const Text(
                'Course Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: courseDescriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                    hintText: "Course Description...",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const SizedBox(height: 16),

              ///////////////////// Pick Course Profile Button //////////////////////
              CustomButton(
                text: 'Pick Profile Course',
                onPressed: () {
                  imagePickerController.pickImages(
                      Theme.of(context).colorScheme, 1, true);
                },
                backgroundColor: Colors.green,
                icon: Icons.video_file_outlined,
              ),
              const SizedBox(height: 5),

              _buildSingleImageView(context),
              const SizedBox(height: 5),

              ///////////////////// Pick Course Videos Button //////////////////////
              CustomButton(
                text: 'Pick Course Videos',
                onPressed: videoPickerController.pickVideos,
                backgroundColor: Colors.green,
                icon: Icons.video_file_outlined,
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Obx(() => ListView.builder(
                      itemCount: videoPickerController.selectedVideos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              const Icon(Icons.video_file, color: Colors.green),
                          title: Text("video ${index + 1}"),
                          subtitle:
                              Text(videoPickerController.selectedVideos[index]),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}