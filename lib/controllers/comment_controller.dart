import 'package:get/get.dart';

class CommentController extends GetxController {

  var comments = <String>[].obs ;
  
  void addComment(String comment){
    if(comment.trim().isNotEmpty){
      comments.add(comment);
    }

  }
}