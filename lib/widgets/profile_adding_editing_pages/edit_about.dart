import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';

class EditAbout extends StatefulWidget {
  @override
  _EditAboutState createState() => _EditAboutState();
}

class _EditAboutState extends State<EditAbout> {
  TextEditingController _aboutController = TextEditingController();
  int maxLength = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit About "),
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
                      "Tell us about yourself:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _aboutController,
                      maxLines: 20,
                      maxLength: maxLength,
                      decoration: InputDecoration(
                        hintText: "Write something about yourself...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    SizedBox(height: 10),

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
