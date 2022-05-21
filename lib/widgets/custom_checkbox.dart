import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile(
      {Key? key, required this.checkValue, required this.text})
      : super(key: key);

  final RxBool checkValue;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Checkbox(
              value: checkValue.value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onChanged: (_) {
                checkValue.value = !checkValue.value;
              },
            ),
            Flexible(child: text)
          ],
        ));
  }
}
