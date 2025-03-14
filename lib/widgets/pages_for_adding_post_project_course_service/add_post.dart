import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/image_picker_controller.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';


class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {


  final TextEditingController postDescriptionController = TextEditingController();
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());


  void _submitPost(BuildContext context) {
    String postText = postDescriptionController.text.trim();

    if (postText.isEmpty && imagePickerController.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something or add an image")),
      );
      return;
    }

    // إرسال البيانات إلى السيرفر أو معالجتها محليًا
    print("Post Text: $postText");
    print("Selected Images: ${imagePickerController.images.length}");

    // إعادة تعيين البيانات
    postDescriptionController.clear();
    imagePickerController.images.clear();

    Get.back(); // الرجوع إلى الصفحة السابقة
  }

  Widget _buildGridView() {
    return Obx(() => GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(imagePickerController.images.length, (index) {
            Asset asset = imagePickerController.images[index];
            return AssetThumb(
              asset: asset,
              width: 300,
              height: 300,
            );
          }),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          TextButton(
            onPressed: () => _submitPost(context),
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ////////////////////////// post content text //////////////////////
              TextField(
                controller: postDescriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  hintText: "What's on your mind?",
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              const SizedBox(height: 20),

                ///////////////////// Pick Course Button //////////////////////
              CustomButton(
                text: "Pick images",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                onPressed: () {
                  imagePickerController.pickImages(Theme.of(context).colorScheme, 1, true);
                },
              ),

              const SizedBox(height: 5),

              // عرض الصور المختارة
              _buildGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

