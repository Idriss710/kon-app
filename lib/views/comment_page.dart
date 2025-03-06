import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/comment_controller.dart';
import 'package:kon/widgets/custom_post_card.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CommentController controller = Get.put(CommentController());

    final TextEditingController commentController = TextEditingController();
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////// Post Card //////////////////////
              CustomPostcustomCard(showLikeComment: false,),

              /////////////////////// Comments List ///////////////////////////
              Obx(
                () => ListView.builder(
                  itemCount: controller.comments.length,
                  shrinkWrap: true, // Prevent infinite height issues
                  physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          /////////////////// Profile Picture & Name & Comment ////////////////////////
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(child: Icon(Icons.person)),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Omer Ali',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('3h', style: TextStyle(color: Colors.grey)),
                                    Text(
                                      controller.comments[index],
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          ///////////////////////// Like & Comment Buttons //////////////////////
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                label: Text('5'),
                                icon: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.green,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  // Get.to(CommentCommentPage(comment: commentController.text.toString(),));
                                },
                                label: Text('20'),
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.green,
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
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          controller.addComment(value);
                        },
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.send))
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
