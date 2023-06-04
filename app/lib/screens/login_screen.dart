import 'package:app/screens/signup_screen.dart';

import 'package:flutter/material.dart';

import '../authentication/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController passwordcontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController forgotpasscontroller = TextEditingController();

//final _key2 = GlobalKey<FormState>();
final field3Key = GlobalKey<FormFieldState<String>>();
final _formKey = GlobalKey<FormState>();
final field1Key = GlobalKey<FormFieldState<String>>();
final field2Key = GlobalKey<FormFieldState<String>>();

class _LoginScreenState extends State<LoginScreen> {
  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      //_formKey.currentState!.save();
      Auth().loginwithEmail(
          email: emailcontroller.text,
          password: passwordcontroller.text,
          context: context);
    }
  }

  Widget circularProgress() {
    return const CircularProgressIndicator(
        backgroundColor: Color.fromRGBO(46, 66, 77, 1));
  }

  bool _forgotpass = false;

  final emailfieldLogin = TextFormField(
    key: field1Key,
    validator: (value) {
      if (value!.isEmpty) {
        return "Please Enter Your Email!";
      }
      //if (!(RegExp(r'^[a-zA-Z0-9._%+-]+@iitp\.ac\.in$').hasMatch(value))) {
        //return ("Please Enter a valid email");
      //}
      return null;
    },
    onSaved: (value) {
      emailcontroller.text = value!;
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    controller: emailcontroller,
    decoration: const InputDecoration(
        hintText: "Institute mail",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
  );
  bool _visibility = true;

  Future<void> _passReset() async {
    if (_formKey.currentState!.validate()) {
      await Auth().passwordForgot(email: emailcontroller.text);
      setState(() {
        _forgotpass = false;
      });
    }
  }

  Widget forgotPasswordScreen() {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: TextFormField(
              key: field3Key,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Email!";
                }
                if (!(RegExp(r'^[a-zA-Z0-9._%+-]+@iitp\.ac\.in$')
                    .hasMatch(value))) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              onSaved: (value) {
                forgotpasscontroller.text = value!;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: const InputDecoration(
                  hintText: "Institute mail",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            )),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              onPressed: _passReset,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(46, 66, 77, 1)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: const Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
        ),
        SizedBox(height: 0.06 * MediaQuery.of(context).size.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: const Color.fromRGBO(46, 66, 77, 1),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _forgotpass = false;
                  });
                }),
          ],
        )
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    final width = 0.21 * MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          surfaceTintColor: const Color(0xd9EAEBED),
          color: const Color(0xd9EAEBED),
          height: 0.075 * MediaQuery.of(context).size.height,
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dont have an account?",
                  style: TextStyle(fontSize: 19)),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const SignUp())));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 19),
                  ))
            ],
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xf2EAEBED),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ClipPath(
                clipper: Wave(),
                child: Container(
                  height: 0.404 * MediaQuery.of(context).size.height,
                  color: const Color.fromRGBO(46, 66, 77, 1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.1 * MediaQuery.of(context).size.height,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 0.513 * MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 35),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/bus logo.png'),
                                    width: 0.36 *
                                        MediaQuery.of(context).size.width,
                                    height: 0.14 *
                                        MediaQuery.of(context).size.height,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.015 *
                                      MediaQuery.of(context).size.height,
                                ),
                                Text(
                                  'Track Your Bus',
                                  style: TextStyle(
                                    fontFamily: 'Righteous',
                                    fontSize: width / 4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 0.43 * MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "IITP",
                                      style: TextStyle(
                                          shadows: const <Shadow>[
                                            Shadow(
                                              offset: Offset(5.0, 5.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            Shadow(
                                              offset: Offset(5.0, 5.0),
                                              blurRadius: 5.0,
                                              color: Color.fromARGB(
                                                  124, 95, 95, 97),
                                            ),
                                          ],
                                          fontSize: width,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Righteous"),
                                    ),
                                    Text(
                                      "Bus Service",
                                      style: TextStyle(
                                          fontFamily: 'Righteous',
                                          fontSize: width / 3,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(40),
              child: _forgotpass
                  ? forgotPasswordScreen()
                  : Form(
                      key: _formKey,
                      child: Column(children: [
                        emailfieldLogin,
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            key: field2Key,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter a Passoword of Minimun 6 characters";
                              }
                              if (!RegExp(r'^.{6,}$').hasMatch(value)) {
                                return ("Enter Valid Password(Min. 6 Character)");
                              }
                              return null;
                            },
                            obscureText: _visibility,
                            textInputAction: TextInputAction.done,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                hintText: " Password",
                                prefixIcon: const Icon(Icons.key),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _visibility = !_visibility;
                                      });
                                    },
                                    icon: Icon(_visibility
                                        ? Icons.visibility
                                        : Icons.visibility_off)))),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: loginUser,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(46, 66, 77, 1)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            setState(() {
                              _forgotpass = true;
                            });
                          },
                        ),
                      ]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wave extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0.94 * size.height);
    Offset controlPoint = Offset(size.width / 40, 0.865 * size.height);
    Offset endPoint = Offset(size.width / 15, 0.869 * size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    Offset controlPoint1 = Offset(0.5 * size.width, size.height);
    Offset endPoint1 = Offset(0.67 * size.width, 0.98 * size.height);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    Offset controlPoint3 = Offset(0.88 * size.width, 0.946 * size.height);
    Offset endPoint3 = Offset(size.width, 0.847 * size.height);
    path.quadraticBezierTo(
        controlPoint3.dx, controlPoint3.dy, endPoint3.dx, endPoint3.dy);
    /*path.conicTo(size.width-250,size.height-90,size.width-140,0,0.9);*/
    Offset arcend1 = Offset(0.58 * size.width, 0);
    Offset arcend2 = Offset(0.52 * size.width, 0);
    path.lineTo(size.width, 0.816 * size.height);
    path.arcToPoint(arcend1, radius: const Radius.circular(155));
    path.moveTo(size.width, 0.816 * size.height);
    path.arcToPoint(arcend2, radius: const Radius.circular(165));
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0.816 * size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
