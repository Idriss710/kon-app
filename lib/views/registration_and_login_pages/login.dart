import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon/controllers/registration_and_login/auth_controller.dart';
import 'package:kon/views/home_scren.dart';
import 'package:kon/views/registration_and_login_pages/forgot_password.dart';
import 'package:kon/views/registration_and_login_pages/rigester.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Allow scrolling when the keyboard is open
          child: Column(
            children: [
              const SizedBox(height: 50),
              ClipOval(
                child: Image.asset(
                  'assets/images/konnn.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 222, 222),
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(175, 0, 0, 0)
                      )
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Login To Your Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(175, 0, 0, 0)
                            ),
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
                                return 'email is required';
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
                                return 'password is required';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    onTap: (){
                                      Get.to(const ForgotPasswordScreen());
                                    },
                                  ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Obx(() {
                            return
                            _authController.isLoading.value ?
                              CircularProgressIndicator() :
                          CustomButton(
                            text: 'Login',
                            borderRadius: 20,
                            backgroundColor: Colors.green,
                            width: double.infinity,
                            onPressed: () {
                              _authController.login(userEmail: emailControler.text.trim(), password: passwordControler.text.trim());
                              // Get.to(HomeScreen());
                            },
                          );
                          },),
                          const SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                " Don't have an account?. ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                child: const Text(
                                  '  Register',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: (){
                                  Get.off(RegistratoinScreen());
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          /////// this row for 'Or' with Lines /////////
                          const Row(
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
                          const SizedBox(height: 10,),
                          /////// this row for Google and Facebook Icons/////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
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
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
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
