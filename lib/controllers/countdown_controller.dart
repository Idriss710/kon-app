import 'dart:async';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  RxInt remainingTime = 120.obs; // Countdown time in seconds
  Timer? _timer;
  RxBool canResend = false.obs ;

  @override
  void onInit() {
    super.onInit();
    canResend.value = false;
  }

  // Start the countdown timer
  void startCountdown() {
    remainingTime.value = 30; // Set initial countdown to 30 seconds
    canResend.value = false;

    _timer?.cancel(); // Cancel any previous timer

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        canResend.value = true; // Allow resend when time is up
        _timer?.cancel();
      }
    });
  }

  // Reset the countdown manually if needed (optional)
  void resetCountdown() {
    startCountdown();
  }
}
