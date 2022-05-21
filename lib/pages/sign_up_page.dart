import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/constants/custom_textstyles.dart';
import 'package:map_tutorial/models/user_info.dart';
import 'package:map_tutorial/pages/maps_page.dart';
import 'package:map_tutorial/widgets/custom_checkbox.dart';
import 'package:map_tutorial/widgets/custom_textfields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pswdCtrl = TextEditingController();
  TextEditingController repeatpswdCtrl = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode pswdFocusNode = FocusNode();
  FocusNode repeatPswdFocusNode = FocusNode();
  var agreeNewsletterCheckbox = false.obs;
  var termsAndCondCheckbox = false.obs;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    pswdCtrl.dispose();
    repeatpswdCtrl.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    pswdFocusNode.dispose();
    repeatPswdFocusNode.dispose();
    super.dispose();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final Shader _linearGradient = LinearGradient(
      colors: [
        Colors.lightBlueAccent.withOpacity(0.4),
        Colors.blue.withOpacity(1),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Map Tutorial',
                      style: TextStyle(
                          fontSize: 52,
                          // color: Colors.blue[400],
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          foreground: Paint()..shader = _linearGradient),
                    ),
                    SizedBox(height: 4.0.h),
                    Text(
                      'Sign Up',
                      style: kTextstyleBlue38,
                    ),
                    SizedBox(height: 4.0.h),
                    SignUpTextfield(
                      controller: nameCtrl,
                      focusNode: nameFocusNode,
                      nextFocusNode: emailFocusNode,
                      hintText: 'name',
                    ),
                    SignUpTextfield(
                      controller: emailCtrl,
                      focusNode: emailFocusNode,
                      nextFocusNode: pswdFocusNode,
                      hintText: 'e-mail',
                    ),
                    SignUpTextfield(
                      controller: pswdCtrl,
                      focusNode: pswdFocusNode,
                      nextFocusNode: repeatPswdFocusNode,
                      hintText: 'password',
                    ),
                    SignUpTextfield(
                      controller: repeatpswdCtrl,
                      focusNode: repeatPswdFocusNode,
                      hintText: 'repeat password',
                    ),
                    SizedBox(height: 2.0.h),
                    CustomCheckBoxTile(
                      checkValue: agreeNewsletterCheckbox,
                      title: 'I agree to receive the Newsletter.',
                    ),
                    CustomCheckBoxTile(
                      checkValue: termsAndCondCheckbox,
                      title:
                          'I agree to the terms of use, privacy policy, and community guidelines.',
                    ),
                    SizedBox(height: 4.0.h),
                    SizedBox(
                      height: 5.0.h,
                      width: 50.0.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            UserInfo userInfo = UserInfo.fromJson({
                              'name': nameCtrl.text,
                              'email': emailCtrl.text,
                              'password': pswdCtrl.text
                            });
                            final SharedPreferences localStorage =
                                await SharedPreferences.getInstance();
                            localStorage.setString(
                                'userInfo', json.encode(userInfo));

                            Get.off(() => MapsPage(
                                  name: nameCtrl.text,
                                ));
                          }
                        },
                        style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 8),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blue),
                          shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
