import 'package:get/get.dart';

class CommentCommentController extends GetxController {

  var comments = <String>[].obs ;
  
  void addComment(String comment){
    if(comment.trim().isNotEmpty){
      comments.add(comment);
    }

  }
}