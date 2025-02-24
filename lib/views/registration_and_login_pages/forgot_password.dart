import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/registration_and_login_pages/verification.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(

          child: SingleChildScrollView(padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image.asset("assets/images/2.png",color: Colors.green, width: 180, height:180),
            SizedBox(height: 20),
            const Text("Verification",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            const Text("Will you receive Verification at your\n email registered on this account ",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            const CustomTextField(
              hintText: "Enter Your Email",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            CustomButton(text: "Send",
                            borderRadius: 20,
                            backgroundColor: Colors.green,
                            width: double.infinity, onPressed: () {
                  Get.to(VerificationScreen());

                            }),
            SizedBox(height: 30),

          ],
        ),
      )),
    );
  }
}
