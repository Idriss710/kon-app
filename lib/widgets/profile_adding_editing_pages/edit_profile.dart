import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/file_picker_controller.dart';
import 'package:kon/controllers/image_picker_controller.dart';
import 'package:kon/controllers/profile_controller.dart';
import 'package:kon/controllers/single_image_picker_controller.dart';
import 'package:kon/controllers/videos_picker_controller.dart';
import 'package:kon/views/home_scren.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final ImagePickerController CoverimagePickerController =
      Get.put(ImagePickerController());
  final SingleImagePickerController ProfileimagePickerController =
      Get.put(SingleImagePickerController());
  final ProfileController profileController = Get.put(ProfileController());

  final FilePickerController _filePickerController = Get.put(FilePickerController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (profileController.username.string.isNotEmpty || profileController.specialization.string.isNotEmpty) {
      
    fullNameController.text = profileController.username.string;
    specializationController.text = profileController.specialization.string;
    }
  }
  void _submitPost(BuildContext context) {
    String full_name = fullNameController.text.trim();
    String specialization = specializationController.text.trim();

    if (full_name.isEmpty &&
        specialization.isEmpty &&
        CoverimagePickerController.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something or add an image")),
      );
      return;
    }

    // send data to supabase .
    // _filePickerController.uploadImage();

    // reset the the data .

    fullNameController.clear();
    specializationController.clear();
    CoverimagePickerController.images.clear();
    _filePickerController.dispose();

    Get.off(HomeScreen()); // الرجوع إلى الصفحة السابقة
  }

  Widget _buildGridViewCoverImage(BuildContext context) {
    return Obx(() {
      if (CoverimagePickerController.images.isEmpty) {
        return Image.asset(
          "assets/images/konnn.png",
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.cover,
        );
        // Return empty widget if the CoverimagePickerController is null
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
      if (_filePickerController.selectedSingleImage.value == null) {
        return Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 3),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/profile.png"), // Replace with the profile image URL
                fit: BoxFit.cover,
              ), // إطار بلون أخضر
            ),
            child: ClipOval(
              child: null,
            )
            // child: Image.network("https://www.example.com/your-profile-image.jpg")
            );
      }
      ////////////// here if the selected image is not null
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green, width: 3), // إطار بلون أخضر
        ),
        child: ClipOval(
          child: Image.file(_filePickerController.selectedSingleImage.value!,
          width:  MediaQuery.of(context).size.width / 2,
        height:  MediaQuery.of(context).size.width / 2,
                          fit:  BoxFit.cover,),
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
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () => _submitPost(context),
            child: const Text(
              'Save',
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///////////////////// Pick Profile Button //////////////////////
              Center(
                child: _buildSingleImageView(context),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Pick Profile Photo',
                icon: Icons.video_file_outlined,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                onPressed: () {
                  // ProfileimagePickerController.pickImages(
                  //     Theme.of(context).colorScheme);

                  _filePickerController.pickImage();
                },
              ),

              const SizedBox(height: 20),

              ///////////////////// Pick Profile Cover Image Button //////////////////////

              // view the the selected image
              _buildGridViewCoverImage(context),
              const SizedBox(height: 20),

              CustomButton(
                text: "Pick Profile Cover",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                onPressed: () {
                  CoverimagePickerController.pickImages(
                      Theme.of(context).colorScheme, 1, true);
                },
              ),

              const SizedBox(height: 20),
              /////////////// Group name /////////////////////////
              Text(
                'Your Full Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                hintText: 'Name',
                controller: fullNameController,
              ),

              /////////////// Specialization /////////////////////////
              Text(
                'Specialization:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                hintText: 'accountant, engineer, developer',
                controller: specializationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
