// import 'package:flutter/material.dart';

// class EducationAndCertificationsCard extends StatelessWidget {  
//   const EducationAndCertificationsCard({super.key});

  

//   @override
//   Widget build(BuildContext context) {
//   final List <Map<String,dynamic>> education = [
//     {'University':'UST', 'BSc, Msc, Php':'Bachelor degree', 'Major':'Information Technology','Grade Or Degree':'Very Good'},
//     {'University':'USTC', 'BSc, Msc, Php':'Master degree', 'Major':'IT','Grade Or Degree':'Good'},
//   ];
    
//     return Container(
//       width: double.infinity,
//       child:  CustomCard(
//               subtitles: education,
//             ),
      
//     );
//   }
// }

// class CustomCard extends StatelessWidget {
//   final List<Map<String, dynamic>> subtitles;

//   const CustomCard({super.key, required this.subtitles});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // color: Colors.green[100],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       elevation: 4,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ...subtitles.map((item) => Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item["University"]!,
//                         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         item["Major"]!,
//                         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         item["BSc, Msc, Php"]!,
//                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                       Text(
//                         item["Grade Or Degree"]!,
//                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                       Divider(color: Colors.grey,)
//                     ],
//                   ),
//                 )),
//           ],
//         ),
      
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/profile_editing_pages/edit_education.dart';

class EducationAndCertifications extends StatelessWidget {
  const EducationAndCertifications({super.key});
  

  @override
  Widget build(BuildContext context) {
      final List <Map<String,dynamic>> education = [
    {'University':'UST', 'BSc, Msc, Php':'Bachelor degree', 'Major':'Information Technology','Grade Or Degree':'Very Good'},
    {'University':'USTC', 'BSc, Msc, Php':'Master degree', 'Major':'IT','Grade Or Degree':'Good'},
  ];
    
    return  Wrap(
      children: education.map((item) =>  Container(
    width: MediaQuery.of(context).size.width,
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
                            Text(
                              item["University"]!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.off(EditEducation());
                              },
                              icon: Icon(Icons.edit, color: Colors.green),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item["Major"]!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          item["BSc, Msc, Php"]!,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          item["Grade Or Degree"]!,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
          ) ,
          ).toList()
        
    );
  }
} 