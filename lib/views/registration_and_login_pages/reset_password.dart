import 'package:flutter/material.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
                
          child: SingleChildScrollView(padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image.asset("assets/images/reset_password.png",color: Colors.green, width: 180, height:180),
            SizedBox(height: 20),
            const Text("Reset Password",style: TextStyle(color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            

            const CustomTextField(
              hintText: "New Password",
              keyboardType: TextInputType.emailAddress,
            ),
            const CustomTextField(
              hintText: "Confirm New Password",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),

            CustomButton(text: "Reset",
                            borderRadius: 20,
                            backgroundColor: Colors.green,
                            width: double.infinity, onPressed: () {}),
            SizedBox(height: 30),

          ],
        ),
      )),
    );
  }
}
