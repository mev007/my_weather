import 'package:my_weather/utils/Constants.dart';

class WeatherModelCityCoord {
/*
{
  "lat": 49.6254,
  "lon": 34.516
} 
*/

  double? lat;
  double? lon;

  WeatherModelCityCoord({
    this.lat,
    this.lon,
  });
  WeatherModelCityCoord.fromJson(Map<String, dynamic> json) {
    lat = json["lat"]?.toDouble();
    lon = json["lon"]?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["lat"] = lat;
    data["lon"] = lon;
    return data;
  }
}

class WeatherModelCity {
/*
{
  "id": 696643,
  "name": "Poltava",
  "coord": {
    "lat": 49.6254,
    "lon": 34.516
  },
  "country": "UA",
  "population": 317847,
  "timezone": 10800,
  "sunrise": 1629427203,
  "sunset": 1629478257
} 
*/

  int? id;
  String? name;
  WeatherModelCityCoord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  WeatherModelCity({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
  WeatherModelCity.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    coord = (json["coord"] != null)
        ? WeatherModelCityCoord.fromJson(json["coord"])
        : null;
    country = json["country"]?.toString();
    population = json["population"]?.toInt();
    timezone = json["timezone"]?.toInt();
    sunrise = json["sunrise"]?.toInt();
    sunset = json["sunset"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    if (coord != null) {
      data["coord"] = coord!.toJson();
    }
    data["country"] = country;
    data["population"] = population;
    data["timezone"] = timezone;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}

class WeatherModelListSys {
/*
{
  "pod": "d"
} 
*/

  String? pod;

  WeatherModelListSys({
    this.pod,
  });
  WeatherModelListSys.fromJson(Map<String, dynamic> json) {
    pod = json["pod"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["pod"] = pod;
    return data;
  }
}

class WeatherModelListWind {
/*
{
  "speed": 4.37,
  "deg": 331,
  "gust": 5.65
} 
*/

  double? speed;
  int? deg;
  double? gust;

  WeatherModelListWind({
    this.speed,
    this.deg,
    this.gust,
  });
  WeatherModelListWind.fromJson(Map<String, dynamic> json) {
    speed = json["speed"]?.toDouble();
    deg = json["deg"]?.toInt();
    gust = json["gust"]?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["speed"] = speed;
    data["deg"] = deg;
    data["gust"] = gust;
    return data;
  }
}

class WeatherModelListClouds {
/*
{
  "all": 96
} 
*/

  int? all;

  WeatherModelListClouds({
    this.all,
  });
  WeatherModelListClouds.fromJson(Map<String, dynamic> json) {
    all = json["all"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["all"] = all;
    return data;
  }
}

class WeatherModelListWeather {
/*
{
  "id": 804,
  "main": "Clouds",
  "description": "overcast clouds",
  "icon": "04d"
} 
*/

  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherModelListWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  WeatherModelListWeather.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    main = json["main"]?.toString();
    description = json["description"]?.toString();
    icon = json["icon"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}

class WeatherModelListMain {
/*
{
  "temp": 300.93,
  "feels_like": 300.56,
  "temp_min": 300.93,
  "temp_max": 300.93,
  "pressure": 1006,
  "sea_level": 1006,
  "grnd_level": 989,
  "humidity": 39,
  "temp_kf": 0
} 
*/

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  int? tempKf;

  WeatherModelListMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });
  WeatherModelListMain.fromJson(Map<String, dynamic> json) {
    temp = json["temp"]?.toDouble();
    feelsLike = json["feels_like"]?.toDouble();
    tempMin = json["temp_min"]?.toDouble();
    tempMax = json["temp_max"]?.toDouble();
    pressure = json["pressure"]?.toInt();
    seaLevel = json["sea_level"]?.toInt();
    grndLevel = json["grnd_level"]?.toInt();
    humidity = json["humidity"]?.toInt();
    tempKf = json["temp_kf"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["sea_level"] = seaLevel;
    data["grnd_level"] = grndLevel;
    data["humidity"] = humidity;
    data["temp_kf"] = tempKf;
    return data;
  }
}

class WeatherModelList {
/*
{
  "dt": 1629460800,
  "main": {
    "temp": 300.93,
    "feels_like": 300.56,
    "temp_min": 300.93,
    "temp_max": 300.93,
    "pressure": 1006,
    "sea_level": 1006,
    "grnd_level": 989,
    "humidity": 39,
    "temp_kf": 0
  },
  "weather": [
    {
      "id": 804,
      "main": "Clouds",
      "description": "overcast clouds",
      "icon": "04d"
    }
  ],
  "clouds": {
    "all": 96
  },
  "wind": {
    "speed": 4.37,
    "deg": 331,
    "gust": 5.65
  },
  "visibility": 10000,
  "pop": 0.02,
  "sys": {
    "pod": "d"
  },
  "dt_txt": "2021-08-20 12:00:00"
} 
*/

  int? dt;
  WeatherModelListMain? main;
  List<WeatherModelListWeather?>? weather;
  WeatherModelListClouds? clouds;
  WeatherModelListWind? wind;
  int? visibility;
  double? pop;
  WeatherModelListSys? sys;
  String? dtTxt;

  WeatherModelList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });
  WeatherModelList.fromJson(Map<String, dynamic> json) {
    dt = json["dt"]?.toInt();
    main = (json["main"] != null)
        ? WeatherModelListMain.fromJson(json["main"])
        : null;
    if (json["weather"] != null) {
      final v = json["weather"];
      final arr0 = <WeatherModelListWeather>[];
      v.forEach((v) {
        arr0.add(WeatherModelListWeather.fromJson(v));
      });
      weather = arr0;
    }
    clouds = (json["clouds"] != null)
        ? WeatherModelListClouds.fromJson(json["clouds"])
        : null;
    wind = (json["wind"] != null)
        ? WeatherModelListWind.fromJson(json["wind"])
        : null;
    visibility = json["visibility"]?.toInt();
    pop = json["pop"]?.toDouble();
    sys = (json["sys"] != null)
        ? WeatherModelListSys.fromJson(json["sys"])
        : null;
    dtTxt = json["dt_txt"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dt"] = dt;
    if (main != null) {
      data["main"] = main!.toJson();
    }
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["weather"] = arr0;
    }
    if (clouds != null) {
      data["clouds"] = clouds!.toJson();
    }
    if (wind != null) {
      data["wind"] = wind!.toJson();
    }
    data["visibility"] = visibility;
    data["pop"] = pop;
    if (sys != null) {
      data["sys"] = sys!.toJson();
    }
    data["dt_txt"] = dtTxt;
    return data;
  }

  String getIconUrl() {
    final nameImage = weather?[0]?.icon ?? '';
    return WEATHER_IMAGES_URL + nameImage + '.png';
  }
  
}

class WeatherModel {
/*
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1629460800,
      "main": {
        "temp": 300.93,
        "feels_like": 300.56,
        "temp_min": 300.93,
        "temp_max": 300.93,
        "pressure": 1006,
        "sea_level": 1006,
        "grnd_level": 989,
        "humidity": 39,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 96
      },
      "wind": {
        "speed": 4.37,
        "deg": 331,
        "gust": 5.65
      },
      "visibility": 10000,
      "pop": 0.02,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2021-08-20 12:00:00"
    }
  ],
  "city": {
    "id": 696643,
    "name": "Poltava",
    "coord": {
      "lat": 49.6254,
      "lon": 34.516
    },
    "country": "UA",
    "population": 317847,
    "timezone": 10800,
    "sunrise": 1629427203,
    "sunset": 1629478257
  }
} 
*/

  String? cod;
  String? message;
  int? cnt;
  List<WeatherModelList?>? list;
  WeatherModelCity? city;

  WeatherModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });
  WeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json["cod"]?.toString();
    message = json["message"]?.toString();
    cnt = json["cnt"]?.toInt();
  if (json["list"] != null) {
  final v = json["list"];
  final arr0 = <WeatherModelList>[];
  v.forEach((v) {
  arr0.add(WeatherModelList.fromJson(v));
  });
    list = arr0;
    }
    city = (json["city"] != null) ? WeatherModelCity.fromJson(json["city"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["cod"] = cod;
    data["message"] = message;
    data["cnt"] = cnt;
    if (list != null) {
      final v = list;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data["list"] = arr0;
    }
    if (city != null) {
      data["city"] = city!.toJson();
    }
    return data;
  }
}