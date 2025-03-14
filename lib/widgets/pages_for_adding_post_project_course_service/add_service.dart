import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/image_picker_controller.dart';
import 'package:kon/controllers/single_image_picker_controller.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_dropDownList.dart';
import 'package:kon/widgets/custom_widgets/custom_input_row_with_uint.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:permission_handler/permission_handler.dart';


class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {

    final List<String> dropDownListitems = ['ddd','qqq','xxx','ccc'];
    final TextEditingController _postController = TextEditingController();

  AppLifecycleListener? _lifecycleListener;

  final SingleImagePickerController CoverimagePickerController = Get.put(SingleImagePickerController());
   final ImagePickerController previouWorksImagePickerController = Get.put(ImagePickerController());
 

  void _submitService(BuildContext context) {
    // String postText = GroupDescriptionController.text.trim();

    if (previouWorksImagePickerController.images.isEmpty && CoverimagePickerController.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write something or add an image")),
      );
      return;
    }

    // // إرسال البيانات إلى السيرفر أو معالجتها محليًا
    // print("Post Text: $postText");
    // print("Selected Images: ${CoverimagePickerController.images.length}");

    // // إعادة تعيين البيانات
    // GroupDescriptionController.clear();
    // CoverimagePickerController.images.clear();

    Get.back(); // الرجوع إلى الصفحة السابقة
  }

  Widget _buildGridView() {
    return Obx(() => GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(previouWorksImagePickerController.images.length, (index) {
            Asset asset = previouWorksImagePickerController.images[index];
            return AssetThumb(
              asset: asset,
              width: 300,
              height: 100,
            );
          }),
        ));
  }
    Widget _buildSingleImageView(BuildContext context) {
    return Obx(() {
      if (CoverimagePickerController.images.isEmpty) {
        return const SizedBox(); // Return empty widget if the previou CoverimagePickerController is null
      }
      Asset asset = CoverimagePickerController.images.first;
      return AssetThumb(
        asset: asset,
        width: MediaQuery.of(context).size.width.toInt(),
        height: 300,
      );
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: Text('Add Service'),
          actions: [
            TextButton(
              onPressed: () {
                _submitService(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
                   ///////////////////// Service Title //////////////////////
                  Text('Service Name:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(hintText: 'Service Name'),

                   ///////////////////// Category //////////////////////
                  Text('Category:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                   CustomDropdownList(
                    items: dropDownListitems,
                    onChanged:(value) {
                      print('dddvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
                      print(value);
                    }, 
                    ),

                   ///////////////////// Service Price //////////////////////
                    const Text('Price:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                          const SizedBox(height: 10,), 
                          CustomTimeInputRow(
                              units: const ['Dolar', 'SDG'],
                              initialUnit: 'Dolar', // Customizable units
                              onChanged: (number, unit) {
                                print('Entered: $number, Unit: $unit');
                              },
                            ),

                  //  ///////////////////// Deliver Time //////////////////////
                  //   const SizedBox(height: 16,), 
                  //   const Text('Deliver Time:',
                  //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //     ),
                  //     const SizedBox(height: 10,), 
                  //       CustomTimeInputRow(
                  //         units: ['Hour', 'Day','Week', 'Month'], // Customizable units
                  //         onChanged: (number, unit) {
                  //           print('Entered: $number, Unit: $unit');
                  //         },
                  //       ),
                  //     const SizedBox(height: 16,), 
                      
                   ///////////////////// Service Description //////////////////////
                  const Text('Service Description:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,), 
                  TextField(
                    controller: _postController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                      hintText: "Talk about the service...",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                   ///////////////////// What you will deliver //////////////////////
                  const Text('What you will deliver:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,),
                  TextField(
                    controller: _postController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                      hintText: "What you will deliver?",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                   ///////////////////// What you will deliver //////////////////////
                  const Text('Key words: maximum 3 words',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                  CustomTextField(hintText: 'programming, arts, design, translation, etc...'),
                  const SizedBox(height: 16),

                   const Text('Maximum 5 Images',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                  const SizedBox(height: 16),
            
                   ///////////////////// Service Cover //////////////////////
              CustomButton(text: "Pick Service Cover",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
               onPressed: () {
                 CoverimagePickerController.pickImages(Theme.of(context).colorScheme);
               } ,),
              
                  const SizedBox(height: 5),

              SizedBox(
                height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: _buildSingleImageView(context),),
                Divider(color: Colors.grey,),
              
              
                   ///////////////////// Previous work photos //////////////////////
                const SizedBox(height: 16),
                   
              CustomButton(text: "Previous work photos",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
               onPressed: () {
                 previouWorksImagePickerController.pickImages(Theme.of(context).colorScheme,
                  5, true);
               } ,),
              
                  const SizedBox(height: 5),

              SizedBox(
                height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: _buildGridView(),),
                Divider(color: Colors.grey,),

              
            ],
                  ),
          ),
        ),
    );
  }
}