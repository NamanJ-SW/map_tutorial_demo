import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/constants/custom_textstyles.dart';
import 'package:map_tutorial/models/user_info.dart';
import 'package:map_tutorial/pages/maps_page.dart';
import 'package:map_tutorial/widgets/custom_checkbox.dart';
import 'package:map_tutorial/widgets/custom_textfields.dart';
import 'package:map_tutorial/widgets/field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final Shader _linearGradient = LinearGradient(
      colors: [
        Colors.lightBlueAccent.withOpacity(0.4),
        Colors.blue.withOpacity(1),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Map Tutorial',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 52,
                          // color: Colors.blue[400],
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          foreground: Paint()..shader = _linearGradient),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Sign Up',
                      style: kTextstyleBlue38,
                    ),
                    SizedBox(height: 40),
                    SignUpTextfield(
                      controller: nameCtrl,
                      focusNode: nameFocusNode,
                      nextFocusNode: emailFocusNode,
                      hintText: 'name',
                      validator: (value) =>
                          FieldValidator().nameValidate(value),
                    ),
                    SignUpTextfield(
                      controller: emailCtrl,
                      focusNode: emailFocusNode,
                      nextFocusNode: pswdFocusNode,
                      hintText: 'e-mail',
                      validator: (value) =>
                          FieldValidator().emailValidate(value),
                    ),
                    SignUpTextfield(
                      controller: pswdCtrl,
                      focusNode: pswdFocusNode,
                      nextFocusNode: repeatPswdFocusNode,
                      hintText: 'password',
                      validator: (value) =>
                          FieldValidator().passwordValidate(value),
                    ),
                    SignUpTextfield(
                      controller: repeatpswdCtrl,
                      focusNode: repeatPswdFocusNode,
                      hintText: 'repeat password',
                      validator: (value) => FieldValidator()
                          .repeatPasswordValidate(value, pswdCtrl.text),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomCheckBoxTile(
                            checkValue: agreeNewsletterCheckbox,
                            text: Wrap(
                              children: [
                                const Text(
                                  'I agree to receive the ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    String url = 'https://www.google.com';
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url));
                                    }
                                  },
                                  child: const Text(
                                    'Newsletter.',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomCheckBoxTile(
                      checkValue: termsAndCondCheckbox,
                      text: Wrap(
                        children: [
                          const Text(
                            'I agree to the ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              String url = 'https://www.google.com';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              }
                            },
                            child: const Text(
                              'terms',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ),
                          const Text(
                            ' of use, privacy policy, and community guidelines.',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: 200,
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
