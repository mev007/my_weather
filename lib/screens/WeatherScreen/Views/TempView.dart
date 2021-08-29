import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/utils/Utils.dart';

import '../../WeatherScreen/WeatherController.dart';

class TempView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    final icon = controller.codeError.value == 888
        ? null
        : controller.weather.value?.list?[0].getIconUrl();
    final temp =
        controller.weather.value?.list?[0].main.temp.toStringAsFixed(1);
    final description =
        controller.weather.value?.list?[0].weather[0].description.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Utils.getIconImage(icon),
          SizedBox(width: 10),
          Column(
            children: [
              Text('$temp ℃', style: TextStyle(fontSize: 54)),
              Text('$description', style: TextStyle(fontSize: 18)),
            ],
          )
        ],
      ),
    );
  }
}
