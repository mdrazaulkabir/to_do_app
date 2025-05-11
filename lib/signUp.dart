import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/login.dart';
import 'package:to_do_app/toDoApp.dart';
import 'package:to_do_app/users.dart';


class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nameControllerLast = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  bool isObscure=true;
  bool isObscure1=true;

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
                          } else
                            return null;
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameControllerLast,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty not allow!";
                          }
                            return null;
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
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Empty not allow!";
                    } else if (value.length < 11) {
                      return "Phone number must be 11 digit";
                    }
                     return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Phone number",
                      labelText: "Enter your Phone number:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.greenAccent,
                      filled: true),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: gmailController,
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
                  obscureText: isObscure,
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
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure=!isObscure;
                            });
                          }, icon: Icon(Icons.visibility_off_outlined))
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: isObscure1,
                  controller: rePassController,
                  validator: (value) {
                    if (value !=passController.text) {
                      return "Password is not matching!";
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
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure1=!isObscure1;
                            });
                          }, icon: Icon(Icons.visibility_off))
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {

                      if (formkey.currentState!.validate()) {

                        users[nameController.text]={
                          "password":passController.text,
                          "namelast":nameControllerLast.text,
                          'phone':phoneController.text,
                          'gmail':gmailController.text,
                        };


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => toDoApp(
                                      name: nameController.text,
                                      namelast: nameControllerLast.text,
                                      phone: phoneController.text,
                                      gmail: gmailController.text,
                                    )));
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
