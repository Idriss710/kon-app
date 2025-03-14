import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_project.dart';
import 'package:kon/widgets/profile_screen_section/project_card.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.work_outline_rounded,
                color: Color.fromARGB(153, 0, 0, 0),
              ),
              SizedBox(
                width: 10,
              ),
              const Text(
                'Projects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              //////////////////////////////////////// add icon //////////////////////////////
              IconButton(
                  onPressed: () {
                    Get.to(EditProjectPage());
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),

              //////////////////////////////////////// add icon //////////////////////////////

              projectCard(context),
              projectCard(context),
              

             ],
      ),
    );
  }
}
