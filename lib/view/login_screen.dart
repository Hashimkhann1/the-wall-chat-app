import 'package:flutter/material.dart';
import 'package:thewall/widgets/my_button.dart';
import 'package:thewall/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obbsecureText: false),
                const SizedBox(
                  height: 10,
                ),

                // password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obbsecureText: true),

                // login button
                const SizedBox(
                  height: 14,
                ),
                MyButton(
                    title: "Sign In",
                    onTap: () {
                      print("Hashim khan");
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
                      onTap: () {},
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
        ),
      ),
    );
  }
}
