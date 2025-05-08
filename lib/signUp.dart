import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/login.dart';
import 'package:to_do_app/toDoApp.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'To-Do App',
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Create your account for To-Do App",
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty not allow!";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "FirstName",
                            labelText: "Enter your FirstName:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.greenAccent,
                            filled: true),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty not allow!";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "LastName",
                            labelText: "Enter your LastName:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.greenAccent,
                            filled: true),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Empty not allow!";
                    } else if (!value.contains('@')) {
                      return "Missing '@' symbol!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Email",
                    labelText: "Enter your email:",
                    filled: true,
                    fillColor: Colors.greenAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Empty not allow!";
                    } else if (value.length < 6) {
                      return "Password mush be 6 character!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                    labelText: "Enter your password:",
                    filled: true,
                    fillColor: Colors.greenAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: rePassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Empty not allow!";
                    } else if (value.length < 6) {
                      return "Password mush be 6 character!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(Icons.password),
                    hintText: "Confirm Password",
                    labelText: "Enter again your password:",
                    filled: true,
                    fillColor: Colors.greenAccent,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => toDoApp()));
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size(double.maxFinite, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 8,
                ),
                RichText(
                    text:
                        TextSpan(text: "Already have an account? ", children: [
                  TextSpan(
                      text: " Login",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        })
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
