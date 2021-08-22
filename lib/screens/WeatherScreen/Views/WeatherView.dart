import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../WeatherScreen/WeatherController.dart';
import 'DetailView.dart';
import 'TempView.dart';

class WeatherView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    final city = controller.weather.value?.city?.name ?? '';
    final country = controller.weather.value?.city?.country ?? '';
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              Text('$city, $country',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TempView(),
              SizedBox(height: 20),
              DetailView(),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('$city, $country',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TempView(),
                ],
              ),
              DetailView(),
            ],
          );
  }
}
