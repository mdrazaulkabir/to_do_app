import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/signUp.dart';
import 'package:to_do_app/toDoApp.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final formkey=GlobalKey<FormState>();

  TextEditingController nameController =TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
                controller: nameController ,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Empty is not allow!';
                  }
                  else return null;
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
                controller: passController,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Empty not allow!";
                  } else if(value.length<6){
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
                    suffixIcon: Icon(Icons.visibility)),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>toDoApp()));

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
              RichText(
                text: TextSpan(text: "Don't have an acount? ", children: [
                  TextSpan(
                      text: " Sign Up",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signUp()));
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
    );
  }
}
