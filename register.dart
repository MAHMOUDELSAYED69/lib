import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_chat/chat.dart';

import 'widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? username;
  String? password;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                CustomTextFormField(
                  fieldName: "username",
                  icon: Icons.person,
                  onSaved: (data) {
                    username = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  fieldName: "Email",
                  icon: Icons.email,
                  onSaved: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  fieldName: "password",
                  icon: Icons.password,
                  onSaved: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 60),
                        backgroundColor: Colors.green),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        log("$email || $password || $username");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                      userName: username!,
                                    )));
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Aleardy have an account"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
