import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/profile_screen.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';

class EditSkills extends StatefulWidget {
  const EditSkills({super.key});

  @override
  State<EditSkills> createState() => _EditSkillsState();
}

class _EditSkillsState extends State<EditSkills> {
  TextEditingController _skillController = TextEditingController();
  int maxLength = 400;

  final List<String> oldskills = ['HTML','PHP','CSS','FLUTTER','ADROID STUDIO','PHP','CSS','FLUTTER','ADROID STUDIO','PHP','CSS','FLUTTER','ADROID STUDIO' ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Skills "),
      leading: IconButton(onPressed: () {
        Get.off(ProfileScreen());
      }, icon: const Icon(Icons.arrow_back)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Save',style: const TextStyle(fontSize: 20 ,color: Colors.green,fontWeight: FontWeight.bold),),
        ) ],
      ),
      
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
                    const SizedBox(height: 10),
                    CustomTextField(hintText: 'Skill Name'),
                    const SizedBox(height: 10),

                    CustomButton(
                    text: "Add",
                     onPressed: () {
                        if (_skillController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Add: ${_skillController.text}")),
                          );
                        }
                      },
                      backgroundColor: Colors.green,
                      width: double.infinity,
                      borderRadius: 20,),

                  // ///////////////////////////////// Old oldSkills Section /////////////////////////
                      const SizedBox(height: 20,),
                      oldSkills(oldskills)
                    
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

/////////////////////////////////////////////////////////////////////////////



  Widget oldSkills(List<String> oldskills) => 
    
      Wrap(
            children: oldskills.map((e) => Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(3, 3)
              )]
            ),
            child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                            onPressed: () {
                              
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.green,
                            ))
                          ],
                        ),
                       
                      ],
                    ),
          ),).toList() ,
          );
        
    

