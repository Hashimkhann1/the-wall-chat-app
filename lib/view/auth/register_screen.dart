import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thewall/data/auth_services/authServices.dart';
import 'package:thewall/data/getx/loading_getx.dart';
import 'package:thewall/view/auth/login_screen.dart';
import 'package:thewall/widgets/my_text_field.dart';

import '../../widgets/my_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService authService = AuthService();
  LoadingServices loadingServices = Get.put(LoadingServices());

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                // const SizedBox(height:40),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                // Welcome back message

                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 40,
                ),

                // email textfield
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obbsecureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }else if(!value.contains('@')){
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obbsecureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }else if(value.toString().length <= 6 ){
                              return "Password length must be grater than 6 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // confirm password
                        MyTextField(
                          controller: confirmPasswordController,
                          hintText: ' Confirm Password',
                          obbsecureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Confirm Password";
                            }else if(passwordController.text.toString() != value.toString()){
                              return "Confirm Password not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    )),

                // login button
                const SizedBox(
                  height: 14,
                ),
                Obx(() {
                  return MyButton(
                      title: "Sign Up",
                      loading: loadingServices.isLoading.value,
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          authService.signUp(context, emailController.text.toString(),
                              passwordController.text.toString(),confirmPasswordController.text.toString());
                        }
                      });
                }),
                const SizedBox(
                  height: 18,
                ),
                // go to regestir
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
