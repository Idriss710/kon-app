import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kon/widgets/custom_widgets/cusom_side_bar.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_course_list_card.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/custom_widgets/custom_post_card.dart';
import 'package:kon/widgets/custom_widgets/custom_search_text_field.dart';
import 'package:kon/widgets/custom_widgets/custom_up_part_of_single_course_page.dart';
import 'package:kon/widgets/custom_widgets/custom_up_part_of_single_group_page.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';

class SingleCoursePage extends StatefulWidget {
  const SingleCoursePage({Key? key}) : super(key: key);

  @override
  _SingleCoursePageState createState() => _SingleCoursePageState();
}

class _SingleCoursePageState extends State<SingleCoursePage> {

  final TextEditingController searchTextEditingController =
      TextEditingController();
  List<String> videosList = ['first index empty ','Introduction','Basics concepts'
                              ,'advanced concepts for going to higher levels in the programming'
                              ,'advanced concepts for going to higher levels in the programming'
                              ,'advanced concepts for going to higher levels in the programming'
                              ,'advanced concepts for going to higher levels in the programming'
                              ,'advanced concepts for going to higher levels in the programming'
                              ,'advanced concepts for going to higher levels in the programming'
                              ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details',) ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // قائمة المنشورات
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // CoverAndPhotoForGroup(),
          
                    Expanded(
                      child: ListView.builder(
                        itemCount: videosList.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CustomUpPartOfSingleCoursePage();
                          }
                         
                          return ListTile(
                          leading: const Icon(Icons.video_file, color: Colors.green),
                          title: Text("video ${index}"),
                          subtitle: Text(videosList[index]),
                          trailing: const Icon(Icons.delete_forever_outlined, color: Colors.red),
                        );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton:CustomButton(text: 'Add Video',
      //   backgroundColor: Colors.green,
      //   onPressed:() {
        
      // },) ,
    );
  }
}
