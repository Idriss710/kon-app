import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_expandable_text.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
      final List <Map<String,dynamic>> education = [
    {'Title':'Full-Stack Developer', 'Location':'United Kingdom', 'Start Period':'2018','End Period':'2020', 'Description':'ITsfsdf sdfsdf sdf sdfsjjjjjjjjj  j jjjjjjjjjjj jjjjj jjjj dkljklj lkjlkj klj lk jlkjl kjlkj ljk jl kjlkjlkj lkjkjkj lk lkjl f sd fs df sdf sd fs dfsdfsdfsdfsdf ffff.'},
    {'Title':'Flutter', 'Location':'Sudan, Port Sudan', 'Start Period':'2020','End Period':'2023', 'Description':'ITsfsdf sdfsdf sdf sdfsjjjjjjjjj  j jjjjjjjjjjj jjjjj jjjj dkljklj lkjlkj klj lk jlkjl kjlkj ljk jl kjlkjlkj lkjkjkj lk lkjl f sd fs df sdf sd fs dfsdfsdfsdfsdf ffff.'},
  ];
     return  Wrap(
      children: education.map((item) =>  Column(
        children: [

          Container(
          width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(148, 76, 175, 79),width: 3),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(3, 3)
                  )]
                ),
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Title: '+item["Title"],
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                          
                            LabeledText(label: 'Location : ', value: item["Location"]
                            ),
                             LabeledText(label: 'Period : ', value: item["Start Period"]+' - '+item["End Period"]
                            ),
          
                            const Text(
                              'Description : ',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              maxLines: 1,
                               overflow: TextOverflow.ellipsis,
                            ),
                            CustomExpandableText(text: item["Description"],maxLines: 1,style: TextStyle(fontSize: 14),)
                          ],
                        ),
              ),
        CustomButton(text: 'Edit', onPressed: () {
          // Get.off(EditExperience());
        },width: MediaQuery.of(context).size.width,backgroundColor: Colors.green) 
        ],
        
      ) ,
          ).toList()
        
    );
  }
}



////////////////////////// LabeledText Widget //////////////////////////

class LabeledText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const LabeledText({
    required this.label,
    required this.value,
    this.labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.valueStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: label, style: labelStyle), // Label (bold)
          TextSpan(text: value, style: valueStyle), // Value (normal)
        ],
      ),
    );
  }
}

////////////////////////// End LabeledText Widget //////////////////////////


