import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/constants/constants.dart';
import 'package:map_tutorial/constants/custom_textstyles.dart';

class TutorialPage2 extends StatelessWidget {
  const TutorialPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Get.back();
          Get.back();
        },
        label: Text(
          'Done',
          style: kTextstyleBlue38.copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tutorial Screen 2'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(settingsImage, fit: BoxFit.fitHeight),
            SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.all(22.0),
              child: Text(
                'To turn on your location services from device settings, enable "location" option given in highlighted red border in above picture.',
                textAlign: TextAlign.justify,
                style: kTextstyleBlack24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
