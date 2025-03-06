import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_text_field.dart';

class EditExperience extends StatefulWidget {
  @override
  _EditExperienceState createState() => _EditExperienceState();
}

class _EditExperienceState extends State<EditExperience> {
  TextEditingController _descriptionController = TextEditingController();
  int maxLength = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Experience "),
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
                      "Job Title:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const CustomTextField(hintText: 'Job Name'),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Location:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const CustomTextField(hintText: 'Name of the  place...'),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Period:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const CustomTextField(hintText: 'Ex. 2012 - 2019'),
                    const SizedBox(height: 10),
                    
                    const Text(
                      "Description:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                     TextField(
                      controller: _descriptionController,
                      maxLines: 20,
                      maxLength: maxLength,
                      decoration: InputDecoration(
                        hintText: "Job description...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    const SizedBox(height: 10),

                    CustomButton(
                    text: "Add",
                     onPressed: () {
                        if (_descriptionController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Saved: ${_descriptionController.text}")),
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
