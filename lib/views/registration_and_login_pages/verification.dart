import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
      ) ,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image.asset("assets/images/3.png", width: 180, height: 180),
            SizedBox(height: 20),
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
            const Text(
              "omer123@gmail.com",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            const CustomTextField(
              hintText: "Verification Code",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't receive OTP?",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '  Resend again.',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
                text: "Verifiy",
                borderRadius: 20,
                backgroundColor: Colors.green,
                width: double.infinity,
                onPressed: () {
                }),
            SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
