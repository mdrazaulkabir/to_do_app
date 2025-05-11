import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/signUp.dart';
import 'package:to_do_app/toDoApp.dart';
import 'package:to_do_app/users.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
   bool isObscure = true;

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
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome back To-Do App",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to your account",
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty is not allow!';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.greenAccent,
                      prefixIcon: Icon(Icons.person),
                      hintText: "Username",
                      labelText: 'Enter the Username',
                      // focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                      return "Password must be 6 character!";
                    }
                    return null;
                    //here passsController.txt and value are same:

                    // value!.isEmpty? return ("Enpty cann't allow") : null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.greenAccent,
                      filled: true,
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Password',
                      labelText: "Enter your password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure=!isObscure;
                            });
                          }, icon: Icon(Icons.visibility_off))),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green[100],
                            fixedSize: Size(double.infinity, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        icon: Icon(Icons.check_box_outline_blank),

                        // icon: Image.network(
                        //   'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                        //   height: 24,
                        //   width: 24,
                        // ),
                        // icon: Image.asset(
                        //   'assets/images/google_logo.png',
                        //   height: 24,
                        //   width: 24,
                        // ),

                        label: Text("Remember for 30 Days")),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.green[100]),
                          child: Text(
                            "Forgot password",
                            style: TextStyle(color: Colors.blue),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final enterName = nameController.text;
                        final enterPass = passController.text;

                        if (users.containsKey(enterName) &&
                            users[enterName]!['password'] == enterPass) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => toDoApp(
                                        name: enterName,
                                        namelast:
                                            users[enterName]!['namelast']!,
                                        phone: users[enterName]!['phone']!,
                                        gmail: users[enterName]!['gmail']!,
                                      )));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid username or password!")));
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        fixedSize: Size(double.maxFinite, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text('OR'),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green[100],
                                fixedSize: Size(double.infinity, 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            icon: Icon(Icons.email_outlined),
                            label: Text("Sign up with Gmail")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.green[100],
                                fixedSize: Size(double.infinity, 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            icon: Icon(Icons.facebook),
                            label: Text("Sign up with Facebook")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(text: "Don't have an acount? ", children: [
                    TextSpan(
                        text: " Sign Up",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()));
                          }),
                  ]),
                ),

                // Wrap(
                //   alignment: WrapAlignment.center,
                //   children: [
                //     Text("Don't have an account"),
                //     TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           'Sign UP',
                //           style: TextStyle(color: Colors.blue),
                //         ))
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
