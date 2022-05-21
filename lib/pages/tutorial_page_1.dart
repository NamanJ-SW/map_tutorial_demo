import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/constants/constants.dart';
import 'package:map_tutorial/constants/custom_textstyles.dart';
import 'package:map_tutorial/pages/tutorial_page_2.dart';
import 'package:sizer/sizer.dart';

class TutorialPage1 extends StatelessWidget {
  const TutorialPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Get.to(() => const TutorialPage2());
        },
        label: Text(
          'Next',
          style: kTextstyleBlue38.copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tutorial Screen 1'),
      ),
      body: Column(
        children: [
          SizedBox(height: 4.0.h),
          Image.asset(locationPermsImage, fit: BoxFit.fitHeight),
          SizedBox(height: 6.0.h),
          const Padding(
            padding: EdgeInsets.all(22.0),
            child: Text(
              'To allow your location permission please click one of the option given in highlighted red border in above picture.',
              textAlign: TextAlign.center,
              style: kTextstyleBlack24,
            ),
          ),
        ],
      ),
    );
  }
}
