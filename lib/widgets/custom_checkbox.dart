import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile(
      {Key? key, required this.checkValue, required this.title})
      : super(key: key);

  final RxBool checkValue;
  final String title;

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
            Flexible(
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ));
  }
}
