import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_app/colors.dart';
import 'package:login_app/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPass = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ) ,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                  "Welcome",
                  style: TextStyle(fontSize: 38, color: Colors.red),
                 ),
                 Text(
                  "back!",
                  style: TextStyle(fontSize: 38, color: Colors.black),
                 ),
                 
                 SizedBox(
                  height: 13,
                 ),
                 Text(
                  "Sing in to access your package history and get real-time updates on all your shipments",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                 ),
               ],
             ),
           ),
           SizedBox(
            height: 20,
           ),
           Expanded(
            flex: 2,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   Expanded(
                     child: Form(
                      autovalidateMode: autovalidateMode,
                      key: _formKey,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Email an't be empty" ;
                                          }
                                         else {
                                          return null;
                                         } 
                                        },
                                       controller: emailController,
                                       onChanged: (value) => setState(() {
                                         emailController.text = value;
                                       }),
                                       decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                         border: OutlineInputBorder(
                                          borderRadius:  BorderRadius.circular(12)
                                         ),
                                         suffixIcon: Icon(LineIcons.user),
                                         //suffixIcon: Icon(Icons.person),
                                         suffixIconColor: blackColor,
                                         labelStyle: TextStyle(color: blackColor),
                                         label: Text("Email")
                                       ),
                                      ),
                                      SizedBox(
                                       height: 20,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.length < 6) {
                                            return "Password must be 6 char";
                                          }
                                         else {
                                          return null;
                                         }
                                        },
                                        obscureText: isPass,
                                        controller: passwordController,
                                       decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                         border: OutlineInputBorder(
                                          borderRadius:  BorderRadius.circular(12)
                                         ),
                                         suffixIconColor: blackColor,
                                         labelStyle: TextStyle(color: blackColor),
                                         suffixIcon: GestureDetector(
                                          child: Icon(Icons.remove_red_eye),
                                          onTap: () {
                                           setState(() {
                                             isPass = !isPass;
                                           }); 
                                          },
                                          ),
                                         //suffixIcon: Icon(Icons.person),
                                         label: Text("Password")
                                       ),
                                      ),
                                  Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     TextButton(
                                       onPressed: () {}, 
                                       child: Text("Forget Password?")),
                                   ],
                                 ),
                                  Row(
                                    children: [
                                      Expanded(child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(15),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                          backgroundColor: Colors.red),
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            Navigator.pushAndRemoveUntil(
                                              context, 
                                              MaterialPageRoute(builder: (context) => HomeScreen(),), 
                                              (route) => false);
                                          }
                                        }, 
                                        child: Text("Login", style: TextStyle(color: Colors.white),)
                                        )
                                        ),
                                    ],
                                  ),
                                 
                                    ],
                                  ),
                     ),
                   ),
              ],
             ),
           ), 
           SizedBox(
            height: 3,
           ),
           Column(
             children: [
               Center(
                child: Text(
                  "Or",
                  style: TextStyle(color: Colors.grey),
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.red),
                      onPressed: () {
                    
                    }, child: Row(
                      children: [
                        Icon(LineIcons.googleLogo, color: Colors.white, applyTextScaling: true,),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Continue with google",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                     ),
                     SizedBox(
                      width: 3,
                     ),
                     Text(
                      "Create new account",
                      style: TextStyle(
                        color: Colors.red
                      ),
                      )
                  ],
                )
                
             ],
           ),
           //Spacer()
          ],
        ),
      ),
    );
  }
}