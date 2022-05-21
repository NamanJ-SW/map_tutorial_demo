import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/widgets/custom_border.dart';

class SignUpTextfield extends StatefulWidget {
  SignUpTextfield({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.hintText,
    this.validator,
  }) : super(key: key);
  TextEditingController controller;
  FocusNode focusNode;
  FocusNode? nextFocusNode;
  String? hintText;
  String? Function(String?)? validator;

  @override
  State<SignUpTextfield> createState() => _SignUpTextfieldState();
}

class _SignUpTextfieldState extends State<SignUpTextfield> {
  @override
  void initState() {
    if (this.mounted) {
      widget.focusNode.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: widget.focusNode.hasFocus
                ? Colors.blue.withOpacity(0.6)
                : Colors.blue.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              5.0,
            ),
          ),
        ],
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        style: const TextStyle(fontSize: 20),
        validator: widget.validator,
        textInputAction: widget.nextFocusNode != null
            ? TextInputAction.next
            : TextInputAction.done,
        onFieldSubmitted: (_) {
          widget.focusNode.unfocus();
          setState(() {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          errorStyle: TextStyle(color: Colors.red, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
          focusedBorder: CustomBorder.signUpFieldBorder,
          border: CustomBorder.signUpFieldBorder,
          enabledBorder: CustomBorder.signUpFieldBorder,
        ),
      ),
    );
  }
}
