import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/RoundedButton.dart';
import '../../utils/Constants.dart';
import '../../utils/Utils.dart';
import '/routes/app_routes.dart';
import 'WeatherController.dart';
import 'views/WeatherView.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherController ctrl =
      Get.put<WeatherController>(WeatherController());
  final _globalKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('Weather App'.tr),
        centerTitle: true,
        actions: [Utils.changeLocateBtt()],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height - AppBar().preferredSize.height,
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildWeather(context),
                    _buildButtons(context),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeather(BuildContext context) {
    return Center(
      child: GetBuilder(
        builder: (WeatherController controller) {
          switch (controller.codeError.value) {
            case 0:
              return CircularProgressIndicator();
            case 200:
              return WeatherView();
            case 888:
              Future.delayed(Duration.zero, () async {
                Get.defaultDialog(
                  title: 'noInternet'.tr,
                  middleText: 'noInternet_message'.tr,
                  textConfirm: 'ok'.tr,
                  confirmTextColor: Colors.white,
                  buttonColor: MAIN_COLOR,
                  onConfirm: () => Get.back(),
                );
                // Get.snackbar(
                //   'noInternet'.tr,
                //   'noInternet_message'.tr,
                //   snackPosition: SnackPosition.TOP,
                //   backgroundColor: Colors.red,
                //   colorText: Colors.white,
                //   duration: Duration(seconds: 3),
                // );
              });
              return WeatherView();
            default:
              return Column(
                children: [
                  Text('Error: ${controller.messageError.value}'),
                  SizedBox(height: 10),
                  Text('${controller.msgError.value}'),
                ],
              );
          }
        },
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              RoundedButton(
                Text('DetailWeather'.tr),
                onPressed: () => Get.toNamed(AppRoutes.DETAIL_SCREEN),
              ),
              SizedBox(height: 10),
              RoundedButton(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.place),
                    SizedBox(width: 10),
                    Text('BttLocation'.tr),
                  ],
                ),
                onPressed: () => ctrl.getWeatherByLocation(),
              ),
              SizedBox(height: 10),
              RoundedButton(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_city),
                    SizedBox(width: 10),
                    Text('BttNameCity'.tr),
                  ],
                ),
                onPressed: _buildDialog,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              RoundedButton(
                Text('DetailWeather'.tr),
                onPressed: () => Get.toNamed(AppRoutes.DETAIL_SCREEN),
              ),
              SizedBox(width: 10),
              RoundedButton(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.place),
                    SizedBox(width: 10),
                    Text('BttLocation'.tr),
                  ],
                ),
                onPressed: () => ctrl.getWeatherByLocation(),
              ),
              SizedBox(width: 10),
              RoundedButton(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_city),
                    SizedBox(width: 10),
                    Text('BttNameCity'.tr),
                  ],
                ),
                onPressed: _buildDialog,
              ),
            ],
          );
  }

  _buildDialog() async {
    final WeatherController ctrl = Get.find<WeatherController>();
    final checkConnection = await ctrl.checkConnection();
    if (!checkConnection) {
      Get.snackbar(
        'noInternet'.tr,
        'noInternet_message'.tr,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }
    ctrl.dialogController.text = '';
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: MAIN_COLOR),
    );
    return Get.defaultDialog(
      title: 'Enter the city name'.tr,
      textCancel: 'cancel'.tr,
      textConfirm: 'ok'.tr,
      cancelTextColor: MAIN_COLOR,
      confirmTextColor: Colors.white,
      buttonColor: MAIN_COLOR,
      content: TextField(
        controller: ctrl.dialogController,
        keyboardType: TextInputType.text,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: 'name'.tr,
          hintMaxLines: 1,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
      onConfirm: () {
        final nameCity = ctrl.dialogController.text;
        if (nameCity.isNotEmpty) ctrl.getWeatherByNameCity(nameCity);
        Get.back();
      },
    );
  }
}
