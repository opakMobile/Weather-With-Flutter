import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/location.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

const apiKey = "44f3081dbc2e800d5f210c838a1be1c0";

class weatherDisplayData {
  Icon icon;
  AssetImage image;

  Icon icon1;
  AssetImage image1;

  Icon icon2;
  AssetImage image2;

  Icon icon3;
  AssetImage image3;

  Icon icon4;
  AssetImage image4;

  Icon icon5;
  AssetImage image5;

  Icon wsaat;
  Icon wsaat1;
  Icon wsaat2;
  Icon wsaat3;
  Icon wsaat4;
  Icon wsaat5;
  Icon wsaat6;
  Icon wsaat7;

  weatherDisplayData({
    required this.icon,
    required this.image,
    required this.icon1,
    required this.image1,
    required this.icon2,
    required this.image2,
    required this.icon3,
    required this.image3,
    required this.icon4,
    required this.image4,
    required this.icon5,
    required this.image5,
    required this.wsaat,
    required this.wsaat1,
    required this.wsaat2,
    required this.wsaat3,
    required this.wsaat4,
    required this.wsaat5,
    required this.wsaat6,
    required this.wsaat7,
  });
}

class WeatherDate {
  WeatherDate({required this.lat, required this.long});
  double lat;
  double long;

  List<String> saatDilimleri = [""];
  List<String> saatDilimleriAyarli = [""];
  late double currentTempature;
  late int currentCondition;

  late var gun1Sicaklik;
  late int gun1Durum;

  late var gun2Sicaklik;
  late int gun2Durum;

  late var gun3Sicaklik;
  late int gun3Durum;

  late var gun4Sicaklik;
  late int gun4Durum;

  late var gun5Sicaklik;
  late int gun5Durum;

  late var saatDilimiSicaklik;
  late int saatDilimDurum;
  late var saatWeather;

  late var saatDilimi1Sicaklik;
  late int saatDilim1Durum;
  late String saat1;

  late var saatDilimi2Sicaklik;
  late int saatDilim2Durum;
  late String saat2;

  late var saatDilimi3Sicaklik;
  late int saatDilim3Durum;
  late String saat3;

  late var saatDilimi4Sicaklik;
  late int saatDilim4Durum;
  late String saat4;

  late var saatDilimi5Sicaklik;
  late int saatDilim5Durum;
  late String saat5;

  late var saatDilimi6Sicaklik;
  late int saatDilim6Durum;
  late String saat6;

  late var saatDilimi7Sicaklik;
  late int saatDilim7Durum;
  late String saat7;

  Future<void> getCurrentTempeture() async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${long}&cnt=150&appid=44f3081dbc2e800d5f210c838a1be1c0&units=metric");

    var response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);
      try {
        currentTempature = currentWeather['list'][1]['main']['temp'];
        currentCondition = currentWeather['list'][1]['weather'][0]['id'];

        gun1Sicaklik = currentWeather['list'][8]['main']['temp'];
        gun1Durum = currentWeather['list'][8]['weather'][0]['id'];

        gun2Sicaklik = currentWeather['list'][16]['main']['temp'];
        gun2Durum = currentWeather['list'][16]['weather'][0]['id'];

        gun3Sicaklik = currentWeather['list'][25]['main']['temp'];
        gun3Durum = currentWeather['list'][25]['weather'][0]['id'];

        gun4Sicaklik = currentWeather['list'][32]['main']['temp'];
        gun4Durum = currentWeather['list'][32]['weather'][0]['id'];

        gun5Sicaklik = currentWeather['list'][39]['main']['temp'];
        gun5Durum = currentWeather['list'][39]['weather'][0]['id'];

        saatDilimiSicaklik = currentWeather['list'][0]['main']['temp'];
        saatDilimDurum = currentWeather['list'][0]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][0]['dt_txt']);

        saatDilimi1Sicaklik = currentWeather['list'][1]['main']['temp'];
        saatDilim1Durum = currentWeather['list'][1]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][1]['dt_txt']);

        saatDilimi2Sicaklik = currentWeather['list'][2]['main']['temp'];
        saatDilim2Durum = currentWeather['list'][2]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][2]['dt_txt']);

        saatDilimi3Sicaklik = currentWeather['list'][3]['main']['temp'];
        saatDilim3Durum = currentWeather['list'][3]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][3]['dt_txt']);

        saatDilimi4Sicaklik = currentWeather['list'][4]['main']['temp'];
        saatDilim4Durum = currentWeather['list'][4]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][4]['dt_txt']);

        saatDilimi5Sicaklik = currentWeather['list'][5]['main']['temp'];
        saatDilim5Durum = currentWeather['list'][5]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][5]['dt_txt']);

        saatDilimi6Sicaklik = currentWeather['list'][6]['main']['temp'];
        saatDilim6Durum = currentWeather['list'][6]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][6]['dt_txt']);

        saatDilimi7Sicaklik = currentWeather['list'][7]['main']['temp'];
        saatDilim7Durum = currentWeather['list'][7]['weather'][0]['id'];
        saatDilimleri.add(currentWeather['list'][7]['dt_txt']);

        for (int i = 1; i < saatDilimleri.length; i++) {
          var gec = saatDilimleri[i].split(" ");
          var gec1 = gec[1].split(":");
          saatDilimleriAyarli.add(gec1[0] + ":" + gec1[1]);
          print(saatDilimleriAyarli[i]);
        }

        print("aaaaa");
        print(saatDilimleri.length);
        print(saatDilimleriAyarli.length);
      } catch (e) {
        print(e);
      }
    } else {
      print("api patladı");
    }
  }

  weatherDisplayData getWeatherDisplayData() {
    Icon fIcon;
    AssetImage fImage;

    Icon fIcon1;
    AssetImage fImage1;

    Icon fIcon2;
    AssetImage fImage2;

    Icon fIcon3;
    AssetImage fImage3;

    Icon fIcon4;
    AssetImage fImage4;

    Icon fIcon5;
    AssetImage fImage5;

    Icon fIconSaat;
    AssetImage fImageSaat;
    Icon fIconSaat1;
    AssetImage fImageSaat1;
    Icon fIconSaat2;
    AssetImage fImageSaat2;
    Icon fIconSaat3;
    AssetImage fImageSaat3;
    Icon fIconSaat4;
    AssetImage fImageSaat4;
    late Icon fIconSaat5;
    AssetImage fImageSaat5;
    Icon fIconSaat6;
    AssetImage fImageSaat6;
    Icon fIconSaat7;
    AssetImage fImageSaat7;

    if (currentCondition >= 200 && currentCondition <= 232) {
      //fırtına
      fIcon = Icon(Icons.thunderstorm_outlined);
      fImage = AssetImage("assets/firtina.jpg");
    } else if (currentCondition >= 300 && currentCondition <= 321) {
      // çiseleme
      fIcon = Icon(WeatherIcons.rain);
      fImage = AssetImage("assets/yagmurluHava.jpg");
    } else if (currentCondition >= 500 && currentCondition <= 531) {
      // yağmur
      fIcon = Icon(WeatherIcons.rain);
      fImage = AssetImage("assets/yagmurluHava.jpg");
    } else if (currentCondition >= 600 && currentCondition <= 622) {
      //kar
      fIcon = Icon(Icons.cloudy_snowing);
      fImage = AssetImage("assets/karliHava.jpg");
    } else if (currentCondition >= 701 && currentCondition <= 781) {
      //sis
      fIcon = Icon(WeatherIcons.night_alt_storm_showers);
      fImage = AssetImage("assets/sisliHava1.jpg");
    } else if (currentCondition == 804) {
      //bulut
      fIcon = Icon(Icons.cloud);
      fImage = AssetImage("assets/bulutlu.jpg");
    } else if (currentCondition >= 800 && currentCondition <= 803) {
      fIcon = Icon(Icons.sunny);
      fImage = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon = Icon(Icons.not_interested_rounded);
      fImage = AssetImage("assets/veriYok.jpg");
    }

    if (gun1Durum >= 200 && gun1Durum <= 232) {
      //fırtına
      fIcon1 = Icon(Icons.thunderstorm_outlined);
      fImage1 = AssetImage("assets/firtina.jpg");
    } else if (gun1Durum >= 300 && gun1Durum <= 321) {
      // çiseleme
      fIcon1 = Icon(WeatherIcons.rain);
      fImage1 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun1Durum >= 500 && gun1Durum <= 531) {
      // yağmur
      fIcon1 = Icon(WeatherIcons.rain);
      fImage1 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun1Durum >= 600 && gun1Durum <= 622) {
      //kar
      fIcon1 = Icon(Icons.cloudy_snowing);
      fImage1 = AssetImage("assets/karliHava.jpg");
    } else if (gun1Durum >= 701 && gun1Durum <= 781) {
      //sis
      fIcon1 = Icon(WeatherIcons.night_alt_storm_showers);
      fImage1 = AssetImage("assets/sisliHava1.jpg");
    } else if (gun1Durum >= 803 && gun1Durum <= 804) {
      //bulut
      fIcon1 = Icon(Icons.cloud);
      fImage1 = AssetImage("assets/bulutlu.jpg");
    } else if (gun1Durum >= 800 && gun1Durum < 803) {
      fIcon1 = Icon(Icons.sunny);
      fImage1 = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon1 = Icon(Icons.not_interested_rounded);
      fImage1 = AssetImage("assets/veriYok.jpg");
    }
    if (gun2Durum >= 200 && gun2Durum <= 232) {
      //fırtına
      fIcon2 = Icon(Icons.thunderstorm_outlined);
      fImage2 = AssetImage("assets/firtina.jpg");
    } else if (gun2Durum >= 300 && gun2Durum <= 321) {
      // çiseleme
      fIcon2 = Icon(WeatherIcons.rain);
      fImage2 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun2Durum >= 500 && gun2Durum <= 531) {
      // yağmur
      fIcon2 = Icon(WeatherIcons.rain);
      fImage2 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun2Durum >= 600 && gun2Durum <= 622) {
      //kar
      fIcon2 = Icon(Icons.cloudy_snowing);
      fImage2 = AssetImage("assets/karliHava.jpg");
    } else if (gun2Durum >= 701 && gun2Durum <= 781) {
      //sis
      fIcon2 = Icon(WeatherIcons.night_alt_storm_showers);
      fImage2 = AssetImage("assets/sisliHava1.jpg");
    } else if (gun2Durum >= 803 && gun2Durum <= 804) {
      //bulut
      fIcon2 = Icon(Icons.cloud);
      fImage2 = AssetImage("assets/bulutlu.jpg");
    } else if (gun2Durum >= 800 && gun2Durum < 803) {
      fIcon2 = Icon(Icons.sunny);
      fImage2 = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon2 = Icon(Icons.not_interested_rounded);
      fImage2 = AssetImage("assets/veriYok.jpg");
    }
    if (gun3Durum >= 200 && gun3Durum <= 232) {
      //fırtına
      fIcon3 = Icon(Icons.thunderstorm_outlined);
      fImage3 = AssetImage("assets/firtina.jpg");
    } else if (gun3Durum >= 300 && gun3Durum <= 321) {
      // çiseleme
      fIcon3 = Icon(WeatherIcons.rain);
      fImage3 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun3Durum >= 500 && gun3Durum <= 531) {
      // yağmur
      fIcon3 = Icon(WeatherIcons.rain);
      fImage3 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun3Durum >= 600 && gun3Durum <= 622) {
      //kar
      fIcon3 = Icon(Icons.cloudy_snowing);
      fImage3 = AssetImage("assets/karliHava.jpg");
    } else if (gun3Durum >= 701 && gun3Durum <= 781) {
      //sis
      fIcon3 = Icon(WeatherIcons.night_alt_storm_showers);
      fImage3 = AssetImage("assets/sisliHava1.jpg");
    } else if (gun3Durum >= 803 && gun3Durum <= 804) {
      //bulut
      fIcon3 = Icon(Icons.cloud);
      fImage3 = AssetImage("assets/bulutlu.jpg");
    } else if (gun3Durum >= 800 && gun3Durum < 803) {
      fIcon3 = Icon(Icons.sunny);
      fImage3 = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon3 = Icon(Icons.not_interested_rounded);
      fImage3 = AssetImage("assets/veriYok.jpg");
    }
    if (gun4Durum >= 200 && gun4Durum <= 232) {
      //fırtına
      fIcon4 = Icon(Icons.thunderstorm_outlined);
      fImage4 = AssetImage("assets/firtina.jpg");
    } else if (gun4Durum >= 300 && gun4Durum <= 321) {
      // çiseleme
      fIcon4 = Icon(WeatherIcons.rain);
      fImage4 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun4Durum >= 500 && gun4Durum <= 531) {
      // yağmur
      fIcon4 = Icon(WeatherIcons.rain);
      fImage4 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun4Durum >= 600 && gun4Durum <= 622) {
      //kar
      fIcon4 = Icon(Icons.cloudy_snowing);
      fImage4 = AssetImage("assets/karliHava.jpg");
    } else if (gun4Durum >= 701 && gun4Durum <= 781) {
      //sis
      fIcon4 = Icon(WeatherIcons.night_alt_storm_showers);
      fImage4 = AssetImage("assets/sisliHava1.jpg");
    } else if (gun4Durum >= 803 && gun4Durum <= 804) {
      //bulut
      fIcon4 = Icon(Icons.cloud);
      fImage4 = AssetImage("assets/bulutlu.jpg");
    } else if (gun4Durum >= 800 && gun4Durum < 803) {
      fIcon4 = Icon(Icons.sunny);
      fImage4 = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon4 = Icon(Icons.not_interested_rounded);
      fImage4 = AssetImage("assets/veriYok.jpg");
    }
    if (gun5Durum >= 200 && gun5Durum <= 232) {
      //fırtına
      fIcon5 = Icon(Icons.thunderstorm_outlined);
      fImage5 = AssetImage("assets/firtina.jpg");
    } else if (gun5Durum >= 300 && gun5Durum <= 321) {
      // çiseleme
      fIcon5 = Icon(WeatherIcons.rain);
      fImage5 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun5Durum >= 500 && gun5Durum <= 531) {
      // yağmur
      fIcon5 = Icon(WeatherIcons.rain);
      fImage5 = AssetImage("assets/yagmurluHava.jpg");
    } else if (gun5Durum >= 600 && gun5Durum <= 622) {
      //kar
      fIcon5 = Icon(Icons.cloudy_snowing);
      fImage5 = AssetImage("assets/karliHava.jpg");
    } else if (gun5Durum >= 701 && gun5Durum <= 781) {
      //sis
      fIcon5 = Icon(WeatherIcons.night_alt_storm_showers);
      fImage5 = AssetImage("assets/sisliHava1.jpg");
    } else if (gun1Durum >= 803 && gun1Durum <= 804) {
      //bulut
      fIcon5 = Icon(Icons.cloud);
      fImage5 = AssetImage("assets/bulutlu.jpg");
    } else if (gun5Durum >= 800 && gun5Durum < 803) {
      fIcon5 = Icon(Icons.sunny);
      fImage5 = AssetImage("assets/gunesli.jpg");
    } else {
      fIcon5 = Icon(Icons.not_interested_rounded);
      fImage5 = AssetImage("assets/veriYok.jpg");
    }

    if (saatDilimDurum >= 200 && saatDilimDurum <= 232) {
      //fırtına
      fIconSaat = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilimDurum >= 300 && saatDilimDurum <= 321) {
      // çiseleme
      fIconSaat = Icon(WeatherIcons.rain);
    } else if (saatDilimDurum >= 500 && saatDilimDurum <= 531) {
      // yağmur
      fIconSaat = Icon(WeatherIcons.rain);
    } else if (saatDilimDurum >= 600 && saatDilimDurum <= 622) {
      //kar
      fIconSaat = Icon(Icons.cloudy_snowing);
    } else if (saatDilimDurum >= 701 && saatDilimDurum <= 781) {
      //sis
      fIconSaat = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilimDurum >= 803 && saatDilimDurum <= 804) {
      //bulut
      fIconSaat = Icon(Icons.cloud);
    } else if (saatDilimDurum >= 800 && saatDilimDurum < 803) {
      fIconSaat = Icon(Icons.sunny);
    } else {
      fIconSaat = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim1Durum >= 200 && saatDilim1Durum <= 232) {
      //fırtına
      fIconSaat1 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim1Durum >= 300 && saatDilim1Durum <= 321) {
      // çiseleme
      fIconSaat1 = Icon(WeatherIcons.rain);
    } else if (saatDilim1Durum >= 500 && saatDilim1Durum <= 531) {
      // yağmur
      fIconSaat1 = Icon(WeatherIcons.rain);
    } else if (saatDilim1Durum >= 600 && saatDilim1Durum <= 622) {
      //kar
      fIconSaat1 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim1Durum >= 701 && saatDilim1Durum <= 781) {
      //sis
      fIconSaat1 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim1Durum >= 803 && saatDilim1Durum <= 804) {
      //bulut
      fIconSaat1 = Icon(Icons.cloud);
    } else if (saatDilim1Durum >= 800 && saatDilim1Durum < 803) {
      fIconSaat1 = Icon(Icons.sunny);
    } else {
      fIconSaat1 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim2Durum >= 200 && saatDilim2Durum <= 232) {
      //fırtına
      fIconSaat2 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim2Durum >= 300 && saatDilim2Durum <= 321) {
      // çiseleme
      fIconSaat2 = Icon(WeatherIcons.rain);
    } else if (saatDilim2Durum >= 500 && saatDilim2Durum <= 531) {
      // yağmur
      fIconSaat2 = Icon(WeatherIcons.rain);
    } else if (saatDilim2Durum >= 600 && saatDilim2Durum <= 622) {
      //kar
      fIconSaat2 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim2Durum >= 701 && saatDilim2Durum <= 781) {
      //sis
      fIconSaat2 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim2Durum >= 803 && saatDilim2Durum <= 804) {
      //bulut
      fIconSaat2 = Icon(Icons.cloud);
    } else if (saatDilim2Durum >= 800 && saatDilim2Durum < 803) {
      fIconSaat2 = Icon(Icons.sunny);
    } else {
      fIconSaat2 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim3Durum >= 200 && saatDilim3Durum <= 232) {
      //fırtına
      fIconSaat3 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim3Durum >= 300 && saatDilim3Durum <= 321) {
      // çiseleme
      fIconSaat3 = Icon(WeatherIcons.rain);
    } else if (saatDilim3Durum >= 500 && saatDilim3Durum <= 531) {
      // yağmur
      fIconSaat3 = Icon(WeatherIcons.rain);
    } else if (saatDilim3Durum >= 600 && saatDilim3Durum <= 622) {
      //kar
      fIconSaat3 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim3Durum >= 701 && saatDilim3Durum <= 781) {
      //sis
      fIconSaat3 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim3Durum >= 803 && saatDilim3Durum <= 804) {
      //bulut
      fIconSaat3 = Icon(Icons.cloud);
    } else if (saatDilim3Durum >= 800 && saatDilim3Durum < 803) {
      fIconSaat3 = Icon(Icons.sunny);
    } else {
      fIconSaat3 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim4Durum >= 200 && saatDilim4Durum <= 232) {
      //fırtına
      fIconSaat4 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim4Durum >= 300 && saatDilim4Durum <= 321) {
      // çiseleme
      fIconSaat4 = Icon(WeatherIcons.rain);
    } else if (saatDilim4Durum >= 500 && saatDilim4Durum <= 531) {
      // yağmur
      fIconSaat4 = Icon(WeatherIcons.rain);
    } else if (saatDilim4Durum >= 600 && saatDilim4Durum <= 622) {
      //kar
      fIconSaat4 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim4Durum >= 701 && saatDilim4Durum <= 781) {
      //sis
      fIconSaat4 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim4Durum >= 803 && saatDilim4Durum <= 804) {
      //bulut
      fIconSaat4 = Icon(Icons.cloud);
    } else if (saatDilim4Durum >= 800 && saatDilim4Durum < 803) {
      fIconSaat4 = Icon(Icons.sunny);
    } else {
      fIconSaat4 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim5Durum >= 200 && saatDilim5Durum <= 232) {
      //fırtına
      fIconSaat5 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim5Durum >= 300 && saatDilim5Durum <= 321) {
      // çiseleme
      fIconSaat5 = Icon(WeatherIcons.rain);
    } else if (saatDilim5Durum >= 500 && saatDilim5Durum <= 531) {
      // yağmur
      fIconSaat5 = Icon(WeatherIcons.rain);
    } else if (saatDilim5Durum >= 600 && saatDilim5Durum <= 622) {
      //kar
      fIconSaat5 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim5Durum >= 701 && saatDilim5Durum <= 781) {
      //sis
      fIconSaat5 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim5Durum >= 803 && saatDilim5Durum <= 804) {
      //bulut
      fIconSaat5 = Icon(Icons.cloud);
    } else if (saatDilim5Durum >= 800 && saatDilim5Durum < 803) {
      fIconSaat5 = Icon(Icons.sunny);
    } else {
      fIconSaat5 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim6Durum >= 200 && saatDilim6Durum <= 232) {
      //fırtına
      fIconSaat6 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim6Durum >= 300 && saatDilim6Durum <= 321) {
      // çiseleme
      fIconSaat6 = Icon(WeatherIcons.rain);
    } else if (saatDilim6Durum >= 500 && saatDilim6Durum <= 531) {
      // yağmur
      fIconSaat6 = Icon(WeatherIcons.rain);
    } else if (saatDilim6Durum >= 600 && saatDilim6Durum <= 622) {
      //kar
      fIconSaat6 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim6Durum >= 701 && saatDilim6Durum <= 781) {
      //sis
      fIconSaat6 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim6Durum >= 803 && saatDilim6Durum <= 804) {
      //bulut
      fIconSaat6 = Icon(Icons.cloud);
    } else if (saatDilim6Durum >= 800 && saatDilim6Durum < 803) {
      fIconSaat6 = Icon(Icons.sunny);
    } else {
      fIconSaat6 = Icon(Icons.not_interested_rounded);
    }

    if (saatDilim7Durum >= 200 && saatDilim7Durum <= 232) {
      //fırtına
      fIconSaat7 = Icon(Icons.thunderstorm_outlined);
    } else if (saatDilim7Durum >= 300 && saatDilim7Durum <= 321) {
      // çiseleme
      fIconSaat7 = Icon(WeatherIcons.rain);
    } else if (saatDilim7Durum >= 500 && saatDilim7Durum <= 531) {
      // yağmur
      fIconSaat7 = Icon(WeatherIcons.rain);
    } else if (saatDilim7Durum >= 600 && saatDilim7Durum <= 622) {
      //kar
      fIconSaat7 = Icon(Icons.cloudy_snowing);
    } else if (saatDilim7Durum >= 701 && saatDilim7Durum <= 781) {
      //sis
      fIconSaat7 = Icon(WeatherIcons.night_alt_storm_showers);
    } else if (saatDilim7Durum >= 803 && saatDilim7Durum <= 804) {
      //bulut
      fIconSaat7 = Icon(Icons.cloud);
    } else if (saatDilim7Durum >= 800 && saatDilim7Durum < 803) {
      fIconSaat7 = Icon(Icons.sunny);
    } else {
      fIconSaat7 = Icon(Icons.not_interested_rounded);
    }

    return weatherDisplayData(
      icon: fIcon,
      image: fImage,
      icon1: fIcon1,
      image1: fImage1,
      icon2: fIcon2,
      image2: fImage2,
      icon3: fIcon3,
      image3: fImage3,
      icon4: fIcon4,
      image4: fImage4,
      icon5: fIcon5,
      image5: fImage5,
      wsaat: fIconSaat,
      wsaat1: fIconSaat1,
      wsaat2: fIconSaat2,
      wsaat3: fIconSaat3,
      wsaat4: fIconSaat4,
      wsaat5: fIconSaat5,
      wsaat6: fIconSaat6,
      wsaat7: fIconSaat7,
    );
  }
}
