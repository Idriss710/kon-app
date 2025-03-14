import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/comment_comment_controller.dart';

class CommentCommentPage extends StatelessWidget {
  final String comment;
  const CommentCommentPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final CommentCommentController controller = Get.put(CommentCommentController());

    final TextEditingController commentController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////// The Main Comment //////////////////////
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile Picture
                    ClipOval(
                      // child: Image.asset(
                      //   'assets/images/profileImage.jpg',
                      //   width: 60,
                      //   height: 60,
                      //   fit: BoxFit.cover,
                      // ),
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 8),

                    /// Name, Time & Comment
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Omer Ali',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '3h',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            comment,
                            style: TextStyle(fontSize: 18),
                            softWrap: true,
                            overflow: TextOverflow.visible, // Prevents overflow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///////////////////////// Like & Comment Buttons Of The Main Comment //////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: Text('5'),
                    icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.green),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text('200'),
                    icon: Icon(Icons.comment, color: Colors.green),
                  ),
                ],
              ),

              /////////////////////// Comments List ///////////////////////////
              Obx(
                () => ListView.builder(
                  itemCount: controller.comments.length,
                  shrinkWrap: true, // Prevents infinite height issues
                  physics: NeverScrollableScrollPhysics(), // Allows only parent to scroll
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          /// Profile Picture & Name & Comment
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(child: Icon(Icons.person)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Omer Ali',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      '3h',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      controller.comments[index],
                                      style: const TextStyle(fontSize: 16),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

               //////////////// Comment Input Field /////////////////////////
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.green),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        onSubmitted: (value) {
                          controller.addComment(value);
                        },
                      ),
                    ),
                    IconButton(onPressed: () {
                      controller.addComment(commentController.text);
                      // commentController.clear();
                    }, icon: Icon(Icons.send,color: Colors.green,),)
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
