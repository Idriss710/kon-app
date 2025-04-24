import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/profile_adding_editing_pages/edit_about.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                             Icon(Icons.person_2_outlined,color: const Color.fromARGB(153, 0, 0, 0),),
                              SizedBox(width: 10,),
                        const Text(
                          'About',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Get.off(EditAbout());
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "My name is aymen I'm sofware developer , asdf sdfa  sdfsdlfkj lsd lfkj  sdfkljlkjsd flkjkj dsfkj lkdsf lkj ljsdflkjl dsflk jlsdfl kj")
                  ],
                ),
              );
  }
}