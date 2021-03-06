import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:statistical_survey/common/common.dart';

class LocationProVider {
  static Future<bool> checkPermission() async {
    LocationPermission _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      log('checkPermission Location: Location permissions are denied');

      return false;
    }
    if (_permission == LocationPermission.deniedForever) {
      log('checkPermission Location: Location permissions are denied forever');

      return false;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    return false;
  }

  static Future<bool> requestLocationServices() async {
    // if true => request location
    // if false => app setting for enable location services

    bool _isEnableLocation = await Geolocator.isLocationServiceEnabled();

    // if (!_isEnableLocation) {
    //   Get.dialog(DialogWidget(
    //       onPressedPositive: () {},
    //       onPressedNegative: () {},
    //       title: 'Ứng dụng chưa bật vị trí',
    //       content: 'Vui lòng bật vị trí để cập nhật vị trí điều tra'));
    // }

    return _isEnableLocation;
  }

  static Future<bool> requestPermission() async {
    // if true => request location
    // if false => app setting for enable location services

    // return
    LocationPermission _permission = await Geolocator.requestPermission();

    if (_permission == LocationPermission.denied) {
      log('checkPermission Location: Location permissions are denied');

      return false;
    }
    if (_permission == LocationPermission.deniedForever) {
      log('checkPermission Location: Location permissions are denied forever');

      return false;
    }

    return false;
  }

  static Future<Position> getLocation() async {
    // bool   await checkPermission();
    await requestLocationServices();
    await requestPermission();
    return await Geolocator.getCurrentPosition();
  }
}
