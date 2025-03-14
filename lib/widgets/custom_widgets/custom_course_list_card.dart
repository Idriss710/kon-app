import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/comment_page.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';

class CustomCourseListCard extends StatefulWidget {
  const CustomCourseListCard({super.key});

  @override
  State<CustomCourseListCard> createState() => _CustomCourseListCardState();
}

class _CustomCourseListCardState extends State<CustomCourseListCard> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:[
         Container(
          padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                        ////////////////// Photo And Name ///////////////////

            Row(
                        ////////////////// Persone Photo ///////////////////
              children: [
                ClipOval(
                  child: Image.asset('assets/images/profileImage.jpg',width: 60,height: 60,fit: BoxFit.cover,),
                ), 
                        ////////////////// Name and Date///////////////////
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('Omer Ali',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text('Flutter Developer',style: TextStyle(color: Colors.grey),),
                      Text('3h',style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                                        
              ],
            ),
                        ////////////////// End Photo And Name ///////////////////
                        ////////////////// Post Description ///////////////////
                        
                        const CustomExpandableText(text: 'textsdsdfsdfsdfsdfsd fsdfsdf sdfsdffsdf sdfsddf fsdfsd fsdf sd fsd fs df',
                        maxLines: 1,),
                        ////////////////// End Post Description ///////////////////
                        //////////////////  Post Image /////////////////////////
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300,
                            minWidth: MediaQuery.of(context).size.width
                            // minWidth: MediaQuery.of(context).size.width,
                            // maxWidth: MediaQuery.of(context).size.width,
                          ),
                          child: Image.asset('assets/images/kon.png',fit: BoxFit.cover,)),
                        //////////////////  End Post Image //////////////////////
                        Row(
                          children: [
                            TextButton.icon(onPressed: () {
                              
                            }, label: Text('2,431'),
                            icon: Icon(Icons.thumb_up_alt_outlined,color: Colors.green,),),
                            Spacer(),
                            Text('140 comments'),
                          ],
                        ),

                        //////////////////  Comment - Share - Like ///////////////////
                        Divider(color: Colors.grey,),
                        Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            IconButton(onPressed: () {
                              
                            }, 
                            icon: Icon(Icons.thumb_up_alt_outlined,color: Colors.green,)
                            ),
                            IconButton(
                              onPressed: () {
                              Get.to(CommentsPage());
                            }, 
                            icon: Icon(Icons.comment_outlined,color: Colors.green,)
                            ),
                            
                          ],
                        ),
                        //////////////////  End Comment - Share - Like ///////////////////
                        
          ],
        ),
      ),
                  Container(height: 5, color: Colors.green[100]),
      ]
    );
  }
}


