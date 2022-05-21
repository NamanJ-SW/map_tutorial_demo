import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_tutorial/constants/constants.dart';
import 'package:map_tutorial/constants/custom_textstyles.dart';
import 'package:map_tutorial/pages/tutorial_page_1.dart';
import 'package:permission_handler/permission_handler.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key? key, required this.name}) : super(key: key);
  String? name;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  void initState() {
    getLocationPerms();
    super.initState();
  }

  getLocationPerms() async {
    await Future.delayed(const Duration(seconds: 1));
    // if device location is on
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      // if location permission is allowed for the app
      if (status.isGranted) {
        isLocationActive.value = true;
        log('Location perms granted');
      } else if (status.isDenied) {
        // if location permission is denied for the app
        isLocationActive.value = false;
        Map<Permission, PermissionStatus> status =
            await [Permission.location].request();
        var newStatus = await Permission.location.status;
        if (newStatus.isDenied) {
          log('Location perms denied');
          openAppSettings();
        } else if (newStatus.isGranted) {
          isLocationActive.value = true;
          log('Location perms granted');
        }
      } else if (await Permission.location.isPermanentlyDenied) {
        openAppSettings();
      }
    } else {
      // Checking if device location is off
      Get.to(() => const TutorialPage1());
    }
  }

  var isLocationActive = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Get.to(() => const TutorialPage1());
        },
        label: Text(
          'Tutorial',
          style: kTextstyleBlue38.copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Text(
                'Hello ${widget.name ?? 'User'}',
                style: kTextstyleBlack24.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Image.asset(
                    mapsImage,
                    fit: BoxFit.cover,
                    height: 500,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 20),
                    child: Obx(
                      () => FloatingActionButton(
                          onPressed: () {
                            getLocationPerms();
                          },
                          heroTag: null,
                          backgroundColor: Colors.white,
                          foregroundColor: isLocationActive.value
                              ? Colors.blue
                              : Colors.black,
                          child: Icon(isLocationActive.value
                              ? Icons.my_location
                              : Icons.location_searching_sharp)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
