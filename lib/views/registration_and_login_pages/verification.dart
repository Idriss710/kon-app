import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/countdown_controller.dart';
import 'package:kon/controllers/registration_and_login/auth_controller.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _authController = Get.find<AuthController>();
  final TextEditingController verifyCodeController = TextEditingController();

  final countdownController = Get.put(CountdownController());
  // final countdownController = Get.find<CountdownController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset("assets/images/3.png", width: 180, height: 180),
                SizedBox(height: 10),
                const Text(
                  "Verification",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                const Text("Enter the verification Code Sent at ",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                Text(
                  "${_authController.email}",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                CustomTextField(
                  hintText: "Verification Code",
                  keyboardType: TextInputType.number,
                  controller: verifyCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'code is required';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't receive OTP?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Obx(
                      () {
                        if (countdownController.canResend.value) {
                          return InkWell(
                            child: const Text(
                              '  Resend again.',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              _authController.resendVerificationCode();
                              Get.snackbar(
                                  'Success', 'Verificatoin Code is Sending...');
                              countdownController.startCountdown();
                            },
                          );
                        } else {
                          return Flexible(
                            child: Text(
                              " Resend after ${countdownController.remainingTime.value}.",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
                CustomButton(
                    text: "Verifiy",
                    borderRadius: 20,
                    backgroundColor: Colors.green,
                    width: double.infinity,
                    onPressed: () {
                      _authController
                          .verifyCode(verifyCodeController.text.trim());
                    }),
                // SizedBox(height: 30),
                // SizedBox(height: 20),
                // Obx(() {
                //   // Show the countdown timer or a message when the button is disabled
                //   if (countdownController.canResend.value) {
                //     return Text("You can now resend the verification code.",
                //      style: const TextStyle(
                //                   fontSize: 15,
                //                   color: Colors.blueGrey,
                //                   fontWeight: FontWeight.bold),);
                //   } else {
                //     return Text(
                //         "Please wait ${countdownController.remainingTime.value} seconds." ,
                //          style: const TextStyle(
                //                   fontSize: 15,
                //                   color: Colors.blueGrey,
                //                   fontWeight: FontWeight.bold),);
                //   }
                // })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
