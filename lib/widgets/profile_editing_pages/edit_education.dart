import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_text_field.dart';

class EditEducation extends StatefulWidget {
  @override
  _EditEducationState createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  TextEditingController _aboutController = TextEditingController();
  int maxLength = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Education "),
      leading: IconButton(onPressed: () {
        Get.off(ProfileScreen());
      }, icon: const Icon(Icons.arrow_back)),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Institute Name:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(hintText: 'Institute Name'),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Degree Of:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(hintText: 'Bachelor, Master, PhD'),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Feild Of Study:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(hintText: 'Business Administration, Accounting, Informaitn Technology '),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Grade:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextField(hintText: 'Excelent, Very Good, Good, etc...'),
                    const SizedBox(height: 10),

                    CustomButton(
                    text: "Save",
                     onPressed: () {
                        if (_aboutController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Saved: ${_aboutController.text}")),
                          );
                        }
                      },
                      backgroundColor: Colors.green,
                      width: double.infinity,
                      borderRadius: 20,)
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
