import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/models/WeatherModel.dart';

import '../../utils/Constants.dart';
import '../../models/UserListWeather.dart';
import '../../utils/Utils.dart';
import '../WeatherScreen/WeatherController.dart';

class DetailScreen extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    final city = controller.weather.value?.city?.name ?? '';
    final country = controller.weather.value?.city?.country ?? '';
    final list = controller.weather.value?.list ?? [];
    List<UserListWeather> dataList = buildList(list);
    int itemCount = countRowList(list);
    return Scaffold(
      appBar: AppBar(
        title: Text('$city, $country'),
        centerTitle: true,
        actions: [Utils.changeLocateBtt()],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          var thirtyDaysFromNow = DateTime.now().add(Duration(days: index));
          var itemsList =
              dataList.where((element) => element.idRecord == index).toList();
          return Column(
            children: [
              Text(
                '${Utils.getFormattedDate(thirtyDaysFromNow)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              _buildListRow(itemsList),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: itemCount,
      ),
    );
  }

  Widget _buildListRow(List<UserListWeather> weatherList) {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => (index == 0)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 5),
                    Expanded(child: Text('time'.tr)),
                    Expanded(child: Text(''), flex: 2),
                    Expanded(
                        child: Text('Weather conditions'.tr,
                            textAlign: TextAlign.right),
                        flex: 2),
                    Expanded(
                        child: Text('temp'.tr, textAlign: TextAlign.right)),
                    Expanded(child: Text('humidity'.tr)),
                    Expanded(child: Text('wind speed'.tr)),
                    SizedBox(height: 5),
                  ],
                ),
              )
            : Container(
                color: MAIN_COLOR.withOpacity(0.1),
                margin: EdgeInsets.symmetric(horizontal: 2),
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 5),
                    Expanded(
                        child: Text('${weatherList[index - 1].time}',
                            style: TextStyle(fontWeight: FontWeight.w700))),
                    Expanded(
                        child: Image.network(weatherList[index - 1].icon ?? ''),
                        flex: 2),
                    Expanded(
                        child: Text('${weatherList[index - 1].description}',
                            textAlign: TextAlign.center),
                        flex: 2),
                    Expanded(
                        child: Text(
                      '${weatherList[index - 1].temp?.round()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              ((weatherList[index - 1].temp?.round() ?? 0) < 0)
                                  ? Colors.blueAccent[700]
                                  : Colors.redAccent[700]),
                    )),
                    Expanded(child: Text('${weatherList[index - 1].humidity}')),
                    Expanded(
                        child:
                            Text('${weatherList[index - 1].speed?.round()}')),
                    SizedBox(height: 5),
                  ],
                ),
              ),
        itemCount: weatherList.length + 1,
      ),
    );
  }

  /// Функція підрахунку кількості днів(рядків) для яких буде прогноз погоди
  int countRowList(List<WeatherModelList?> weatherList) {
    int i = 1;
    String tempD = Utils.getFormattedDateD(
        DateTime.fromMillisecondsSinceEpoch((weatherList[0]?.dt ?? 0) * 1000));
    for (var item in weatherList) {
      String d = Utils.getFormattedDateD(
          DateTime.fromMillisecondsSinceEpoch((item?.dt ?? 0) * 1000));
      if (d != tempD) {
        i++;
        tempD = d;
      }
    }
    return i;
  }

  /// Побудова списку обєктів UserListWeather
  List<UserListWeather> buildList(List<WeatherModelList?> weatherList) {
    List<UserListWeather> dataList = [];
    int i = 0;
    String tempD = Utils.getFormattedDateD(
        DateTime.fromMillisecondsSinceEpoch((weatherList[0]?.dt ?? 0) * 1000));

    for (var item in weatherList) {
      DateTime date =
          DateTime.fromMillisecondsSinceEpoch((item?.dt ?? 0) * 1000);
      String d = Utils.getFormattedDateD(date);
      if (d != tempD) {
        i++;
        tempD = d;
      }
      var value = UserListWeather(
        idRecord: i,
        date: date,
        time: Utils.getFormattedDateH(date),
        icon: Utils.getIconUrl(item?.weather?[0]?.icon ?? ''),
        description: item?.weather?[0]?.description,
        temp: item?.main?.temp,
        humidity: item?.main?.humidity,
        speed: item?.wind?.speed,
      );
      dataList.add(value);
    }
    return dataList;
  }
}
