import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/mainScreen.dart';
import 'package:flutter_application_1/utils/location.dart';
import 'package:flutter_application_1/utils/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationHelper;
  Future<void> getLocationData() async {
    locationHelper = new LocationHelper();
    await locationHelper.getCurrentLocation();

    print("anananananana");
    print(locationHelper.longitude);
    print("\n");
    print(locationHelper.latitude);
  }

  void getWeatherData() async {
   // await getLocationData();
    WeatherDate weatherDate = new WeatherDate(lat:37.874641 ,long:32.493156 );
    await weatherDate.getCurrentTempeture();
    if (weatherDate.currentTempature == null ||
        weatherDate.currentCondition == null) {
      print("apiden sıcaklık gelmdi");
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return mainScreen(
        weatherDate: weatherDate,
        gelenSehir: "Konya",
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.blue])),
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50,
            duration: Duration(milliseconds: 2200),
          ),
        ),
      ),
    );
  }
}
