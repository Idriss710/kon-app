import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/views/registration_and_login_pages/login.dart';
import 'package:kon/widgets/custom_button.dart';
import 'package:kon/widgets/custom_text_field.dart';

class RegistratoinScreen extends StatefulWidget {
  const RegistratoinScreen({super.key});

  @override
  State<RegistratoinScreen> createState() => _RegistratoinScreenState();
}

class _RegistratoinScreenState extends State<RegistratoinScreen> {
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Allow scrolling when the keyboard is open
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/konnn.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 222, 222),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "signup",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(175, 0, 0, 0)
                      )
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Create New Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(175, 0, 0, 0)
                            ),
                          ),
                          CustomTextField(
                            hintText: "Name",
                            controller: nameControler,
                            icon: Icons.person_2_outlined,
                            iconColor: Colors.green,
                            borderColor: Colors.green,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'name is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            hintText: "Email",
                            controller: emailControler,
                            icon: Icons.email_outlined,
                            iconColor: Colors.green,
                            borderColor: Colors.green,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'name is required';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            hintText: "Password",
                            controller: passwordControler,
                            icon: Icons.lock_outline,
                            iconColor: Colors.green,
                            borderColor: Colors.green,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10,),
                          /////// this row for 'Or' Sign up button /////////
                          CustomButton(
                            text: 'Signup',
                            borderRadius: 20,
                            backgroundColor: Colors.green,
                            width: double.infinity,
                            onPressed: () {},
                          ),
                          SizedBox(height: 20,),
                          /////// row of already have an account and Login  /////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?. ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: (){
                                  Get.off(LoginScreen());
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          /////// this row for 'Or' with Lines /////////
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                )
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          /////// this row for Google and Facebook Icons/////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: Image.asset(
                                    "assets/images/facebook1.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
