import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thewall/data/auth_services/authServices.dart';
import 'package:thewall/data/getx/loading_getx.dart';
import 'package:thewall/view/auth/register_screen.dart';
import 'package:thewall/widgets/my_button.dart';
import 'package:thewall/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  LoadingServices loadingServices = Get.put(LoadingServices());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: Text("Login"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Center(
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
                      key: formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obbsecureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
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
                              } else if (value.length <= 6) {
                                return "Passsword must be grater than 6 characters";
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
                        title: "Sign In",
                        loading: loadingServices.isLoading.value,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            authService.loginuser(context , emailController.text.toString(),
                                passwordController.text.toString());
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
                        "Not a member?",
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
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
