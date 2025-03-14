import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/image_picker_controller.dart';
import 'package:kon/controllers/single_image_picker_controller.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

class AddGroupPage extends StatefulWidget {
  const AddGroupPage({super.key});

  @override
  State<AddGroupPage> createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {

  
  final TextEditingController GroupDescriptionController = TextEditingController();
  final ImagePickerController CoverimagePickerController = Get.put(ImagePickerController());
  final SingleImagePickerController ProfileimagePickerController = Get.put(SingleImagePickerController());
 

  void _submitPost(BuildContext context) {
    String postText = GroupDescriptionController.text.trim();

    if (postText.isEmpty && CoverimagePickerController.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something or add an image")),
      );
      return;
    }

    // إرسال البيانات إلى السيرفر أو معالجتها محليًا
    print("Post Text: $postText");
    print("Selected Images: ${CoverimagePickerController.images.length}");

    // إعادة تعيين البيانات
    GroupDescriptionController.clear();
    CoverimagePickerController.images.clear();

    Get.back(); // الرجوع إلى الصفحة السابقة
  }

  Widget _buildGridView() {
    return Obx(() {
      if (CoverimagePickerController.images.isEmpty) {
        return const SizedBox(); // Return empty widget if the CoverimagePickerController is null
      }
      Asset asset = CoverimagePickerController.images.first;
      return AssetThumb(
        asset: asset,
        width: MediaQuery.of(context).size.width.toInt(),
        height: 300,
      );
    });
  }

    Widget _buildSingleImageView(BuildContext context) {
    return Obx(() {
      if (ProfileimagePickerController.images.isEmpty) {
        return const SizedBox(); // Return empty widget if the ProfileimagePickerController is null
      }
      Asset asset = ProfileimagePickerController.images.first;
      return Container(
      width: MediaQuery.of(context).size.width/2,
      height:  MediaQuery.of(context).size.width/2,
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

/////////// GetX when left the page it call dispose
  // @override
  // void dispose() {

  //   GroupDescriptionController.dispose();
  //   ProfileimagePickerController.dispose();
  //   CoverimagePickerController.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Group'),
        actions: [
          TextButton(
            onPressed: () => _submitPost(context),
            child: const Text(
              'Create',
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
              /////////////// Group name /////////////////////////
              Text('Group Name:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              CustomTextField(hintText: 'Name'),

                            /////////////// Group Description /////////////////////////
                Text('Group Description:',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 16,),
              TextField(
                controller: GroupDescriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  hintText: "Group Description...",
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              const SizedBox(height: 20),

                ///////////////////// Pick Group Profile Button //////////////////////
            
              CustomButton(
                text:'Pick Profile Group',
                icon: Icons.video_file_outlined,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                onPressed: () {
                  ProfileimagePickerController.pickImages(
                      Theme.of(context).colorScheme);
                },
              ),

              const SizedBox(height: 20),
              _buildSingleImageView(context),
              const SizedBox(height: 20),

                ///////////////////// Pick Group Cover Image Button //////////////////////
              CustomButton(
                text: "Pick Group Cover",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                onPressed: () {
                  CoverimagePickerController.pickImages(Theme.of(context).colorScheme, 1, true);
                },
              ),

              const SizedBox(height: 20),

              // عرض الصور المختارة
              _buildGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

