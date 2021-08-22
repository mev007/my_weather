import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'Constants.dart';

class Utils {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy').format(dateTime); //05.08.2020
  }

  static String getFormattedDateD(DateTime dateTime) {
    return DateFormat('d').format(dateTime); //5
  }

  static String getFormattedDateH(DateTime dateTime) {
    return DateFormat('H').format(dateTime); //15
  }

  static String getIconUrl(String nameIcon) {
    return WEATHER_IMAGES_URL + nameIcon + '.png';
  }

  static Widget changeLocateBtt() {
    return TextButton(
      onPressed: () {
        final locale = Get.locale == Locale('en', 'US')
            ? Locale('ua', 'UA')
            : Locale('en', 'US');
        // var locale = Locale('en', 'US');
        Get.updateLocale(locale);
      },
      child: Text('en/ua', style: TextStyle(color: Colors.white)),
    );
  }
}
