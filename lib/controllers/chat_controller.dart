import 'package:get/get.dart';
import 'package:kon/models/chat_message.dart';

class ChatController extends GetxController {

  var messages = <ChatMessage>[].obs;
  var messageController = ''.obs;

  void sendMessage(){
    if (messageController.value.trim().isNotEmpty) {
      messages.add(ChatMessage(text: messageController.value, isMe: true));
      messageController.value = '' ;
    }
  }

}