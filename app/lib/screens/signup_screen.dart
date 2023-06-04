import 'package:app/authentication/auth.dart';
import 'package:app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

final TextEditingController _phonecontroller = TextEditingController();
final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _rollnocontroller = TextEditingController();

bool? _checked = false;
bool _visibility0 = true; //for password
bool _visibility1 = true; //for confirm password

final _formkeysignup = GlobalKey<FormState>();
GlobalKey<FormFieldState<String>> field1Key =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> field2Key =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> field3Key =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> field4Key =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> field5Key =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> field6Key =
    GlobalKey<FormFieldState<String>>();

final namefield = TextFormField(
  key: field1Key,
  controller: _namecontroller,
  validator: (value) {
    if (value!.isEmpty) {
      return "Please Enter Your Name!";
    }
    return null;
  },
  keyboardType: TextInputType.name,
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10))),
      hintText: "Fullname",
      prefixIcon: Icon(Icons.account_box_outlined)),
);

final emailfieldsignup = TextFormField(
  key: field2Key,
  validator: (value) {
    if (value!.isEmpty) {
      return "Please Enter Your Email!";
    }
    if (!RegExp(r"^[^\s@]+@[^\s@]+\.(?!iitp\.ac\.in)[^\s@]+$")
        .hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  },
  textInputAction: TextInputAction.next,
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10))),
      hintText: "Institute mail",
      prefixIcon: Icon(Icons.email_outlined)),
);

final phonefield = TextFormField(
  key: field3Key,
  controller: _phonecontroller,
  validator: (value) {
    if (value!.isEmpty) {
      return "Please Enter Your Phone number!";
    } else if (!RegExp(r'^.{10,10}$').hasMatch(value)) {
      return ("Enter a valid phone number");
    }
    return null;
  },
  keyboardType: TextInputType.phone,
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10))),
      hintText: "Phone no.",
      prefixIcon: Icon(Icons.phone)),
);
final rollnofield = TextFormField(
  key: field4Key,
  controller: _rollnocontroller,
  validator: (value) {
    if (value!.isEmpty) {
      return "Please Enter Your Roll Number!";
    }
    return null;
  },
  textInputAction: TextInputAction.next,
  decoration: const InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10), right: Radius.circular(10))),
      hintText: "Roll no.",
      prefixIcon: Icon(Icons.assignment)),
);

class _SignUpState extends State<SignUp> {
  Future<void> signupUser() async {
    if (_formkeysignup.currentState!.validate()) {
      _formkeysignup.currentState!.save();
      if (_checked!) {
        await Auth().signupwithEmail(
          email: _emailController.text,
          password: _passwordController.text,
          rollno: _rollnocontroller.text,
          name: _namecontroller.text,
          phoneno: _phonecontroller.text,
          context: context,
        );
      } else {
        Fluttertoast.showToast(
            msg: 'Accept the terms and conditions to proceed');
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(46, 66, 77, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xd9EAEBED),
                    ),
                  ),
                ]),
                Image.asset('assets/images/signup_logo.png'),
                const Text(
                  "Create Account",
                  style: TextStyle(
                      fontFamily: "Righteous",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: (Colors.white)),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Color(0xd9EAEBED)),
            child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formkeysignup,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        namefield,
                        emailfieldsignup,
                        phonefield,
                        rollnofield,
                        TextFormField(
                          key: field5Key,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter a Passoword of Minimun 6 characters";
                            }
                            if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                      right: Radius.circular(10))),
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _visibility0 = !_visibility0;
                                    });
                                  },
                                  icon: Icon(_visibility0
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          obscureText: _visibility0,
                        ),
                        TextFormField(
                          key: field6Key,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return "Passwords dont match";
                            }

                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: _visibility1,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10),
                                      right: Radius.circular(10))),
                              hintText: "Confirm Password",
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _visibility1 = !_visibility1;
                                    });
                                  },
                                  icon: Icon(_visibility1
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        ListTileTheme(
                          horizontalTitleGap: 0,
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Row(
                              children: [
                                const Text(
                                  "I Accept the",
                                  style: TextStyle(fontSize: 13),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("Terms and Conditions",
                                        style: TextStyle(fontSize: 13)))
                              ],
                            ),
                            value: _checked,
                            onChanged: (bool? value) {
                              setState(() {
                                _checked = value;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        SizedBox(
                          height: 0.06 * MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: 
                              signupUser,
                              

                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(46, 66, 77, 1)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: const Text(
                                "Register",
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                      ]),
                )),
          ))
        ],
      ),
    );
  }
}
