import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../WeatherScreen/WeatherController.dart';

class DetailView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    final pressure =
        (controller.weather.value?.list?[0]?.main?.pressure ?? 0) * 0.750062;
    final humidity = controller.weather.value?.list?[0]?.main?.humidity;
    final wind = controller.weather.value?.list?[0]?.wind?.speed;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getItem(Icons.thermostat, pressure.round(), 'pressure'.tr),
        getItem(Icons.water, humidity ?? 0, '%'),
        getItem(Icons.storm, wind?.toInt() ?? 0, 'wind'.tr),
      ],
    );
  }

  Widget getItem(IconData iconData, int value, String units) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Icon(iconData, size: 28),
          SizedBox(height: 10),
          Text('$value', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(units, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
