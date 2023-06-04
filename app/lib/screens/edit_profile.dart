import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _rollnocontroller = TextEditingController();

final _formkeyep = GlobalKey<FormState>();
GlobalKey<FormFieldState<String>> namefieldKey =
    GlobalKey<FormFieldState<String>>();
GlobalKey<FormFieldState<String>> rollfieldKey =
    GlobalKey<FormFieldState<String>>();

String name = "hhh";
String roll = "hhh";

class _EditProfileScreenState extends State<EditProfileScreen> {
  FocusNode nameFocusNode = FocusNode();
  FocusNode rollFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    nameFocusNode = FocusNode();
    _namecontroller.text = name;
    rollFocusNode = FocusNode();
    _rollnocontroller.text = roll;
    
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    rollFocusNode.dispose();
   // _namecontroller.dispose();
   // _rollnocontroller.dispose();
    super.dispose();
  }

  bool editname = false;
  bool editroll = false;
  @override
  Widget build(BuildContext context) {
    //_namecontroller.text = name;
    _namecontroller.selection =
        TextSelection.collapsed(offset: _namecontroller.text.length);
    //_rollnocontroller.text = roll;
    _rollnocontroller.selection =
        TextSelection.collapsed(offset: _rollnocontroller.text.length);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(46, 66, 77, 1),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                  "Edit Profile",
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
                          key: _formkeyep,
                          child: Column(children: [
                            TextFormField(
                              key: namefieldKey,
                              focusNode: nameFocusNode,
                              controller: _namecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Name!";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                          right: Radius.circular(10))),
                                  hintText: "Fullname",
                                  prefixIcon:
                                      const Icon(Icons.account_box_outlined),
                                  suffixIcon: OutlinedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromRGBO(46, 66, 77, 1))),
                                    onPressed: () {
                                      setState(() {
                                        editroll = !editroll;
                                        nameFocusNode.requestFocus();
                                      });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Color(0xd9EAEBED),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              focusNode: rollFocusNode,
                              readOnly: editroll,
                              key: rollfieldKey,
                              controller: _rollnocontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Roll Number!";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: "Roll Number",
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                          right: Radius.circular(10))),
                                  hintText: "Roll no.",
                                  prefixIcon: const Icon(Icons.assignment),
                                  suffixIcon: OutlinedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromRGBO(46, 66, 77, 1))),
                                    onPressed: () {
                                      setState(() {
                                        editroll = !editroll;
                                        rollFocusNode.requestFocus();
                                      });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Color(0xd9EAEBED),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            SizedBox(
                              height: 0.06 * MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _formkeyep.currentState!.save();
                                      nameFocusNode.unfocus();
                                      rollFocusNode.unfocus();
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  46, 66, 77, 1)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                  child: const Text(
                                    "Save Changes",
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ),
                          ]))))),
        ]));
  }
}
