import 'dart:convert';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/utils/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../customDiyalog.dart';
import '../utils/sabitler.dart';

class mainScreen extends StatefulWidget {
  final WeatherDate weatherDate;
  final String gelenSehir;
  const mainScreen(
      {super.key, required this.weatherDate, required this.gelenSehir});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  var now = DateTime.now();
  late String bir;
  late String iki;
  late String uc;
  late String dort;
  late String bes;

  late String sehirAdi;
  TextEditingController t1 = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late int temp;
  late Icon icon;
  late AssetImage im;

  late int temp1;
  late Icon icon1;
  late AssetImage im1;

  late int temp2;
  late Icon icon2;
  late AssetImage im2;

  late int temp3;
  late Icon icon3;
  late AssetImage im3;

  late int temp4;
  late Icon icon4;
  late AssetImage im4;

  late int temp5;
  late Icon icon5;
  late AssetImage im5;
  late String tem;

  late int saat;
  late int saat1;
  late int saat2;
  late int saat3;
  late int saat4;
  late int saat5;
  late int saat6;
  late int saat7;

  late Icon sIcon;
  late Icon sIcon1;
  late Icon sIcon2;
  late Icon sIcon3;
  late Icon sIcon4;
  late Icon sIcon5;
  late Icon sIcon6;
  late Icon sIcon7;

  List<String> saatMain = [""];

  void info(WeatherDate weatherDate) {
    setState(() {
      temp = weatherDate.currentTempature.round();
      temp1 = weatherDate.gun1Sicaklik.round();
      temp2 = weatherDate.gun2Sicaklik.round();
      temp3 = weatherDate.gun3Sicaklik.round();
      temp4 = weatherDate.gun4Sicaklik.round();
      temp5 = weatherDate.gun5Sicaklik.round();

      saat = weatherDate.saatDilimiSicaklik.round();
      saat1 = weatherDate.saatDilimi1Sicaklik.round();
      saat2 = weatherDate.saatDilimi2Sicaklik.round();
      saat3 = weatherDate.saatDilimi3Sicaklik.round();
      saat4 = weatherDate.saatDilimi4Sicaklik.round();
      saat5 = weatherDate.saatDilimi5Sicaklik.round();
      saat6 = weatherDate.saatDilimi6Sicaklik.round();
      saat7 = weatherDate.saatDilimi7Sicaklik.round();

      for (int i = 1; i < weatherDate.saatDilimleriAyarli.length; i++) {
        saatMain.add(weatherDate.saatDilimleriAyarli[i]);
      }

      print("aaaaa");

      print(weatherDate.saatDilimleri.length);
      print(weatherDate.saatDilimleriAyarli.length);

      weatherDisplayData displayData = weatherDate.getWeatherDisplayData();
      im = displayData.image;
      icon = displayData.icon;

      im1 = displayData.image1;
      icon1 = displayData.icon1;

      im2 = displayData.image2;
      icon2 = displayData.icon2;

      im3 = displayData.image3;
      icon3 = displayData.icon3;

      im4 = displayData.image4;
      icon4 = displayData.icon4;

      im5 = displayData.image4;
      icon5 = displayData.icon4;

      sIcon = displayData.wsaat;
      sIcon1 = displayData.wsaat1;
      sIcon2 = displayData.wsaat2;
      sIcon3 = displayData.wsaat3;
      sIcon4 = displayData.wsaat4;
      sIcon5 = displayData.wsaat5;
      sIcon6 = displayData.wsaat6;
      sIcon7 = displayData.wsaat7;
    });
  }

  void gunBul() {
    var now = DateTime.now();
    var sozluk = {
      0: "Pazartesi",
      1: "Salı     ",
      2: "Çarşamba ",
      3: "Perşembe ",
      4: "Cuma     ",
      5: "Cumartesi",
      6: "Pazar    "
    };
    var bugun = now.weekday - 1;
    print("bugun" + bugun.toString());
    bir = sozluk[(bugun + 1) % 7]!; //prş 3
    iki = sozluk[(bugun + 2) % 7]!; //cuma 4
    uc = sozluk[(bugun + 3) % 7]!; // cumarte 5
    dort = sozluk[(bugun + 4) % 7]!; //pazar 6
    bes = sozluk[(bugun + 5) % 7]!; // pazarts 7
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    info(widget.weatherDate);
    gunBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (context) {
              return {'Şehir Ara', 'Çıkış Yap'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration:
            BoxDecoration(image: DecorationImage(image: im, fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
              ),
              icon,
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  '$temp°',
                  style: TextStyle(color: Colors.white, fontSize: 80),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                widget.gelenSehir,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              SizedBox(height: 325),
              SingleChildScrollView(
                child: SizedBox(
                  height: 80,
                  child: Container(
                    child: Card(
                      color: Colors.white24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(saatMain[1]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[2]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon1,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat1.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[3]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon2,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat2.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[4]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon3,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat3.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[5]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon4,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat4.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[6]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon5,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat5.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[7]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon6,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat6.toString() + "°"),
                            ],
                          ),
                          Column(
                            children: [
                              Text(saatMain[8]),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              sIcon7,
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(saat7.toString() + "°"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(width: 70, child: Text(bir)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(width: 24, child: Text('$temp1°')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 10),
                        child: SizedBox(width: 20, child: icon1),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(width: 70, child: Text(iki)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(width: 24, child: Text('$temp2°')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 10),
                        child: SizedBox(width: 20, child: icon2),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(width: 70, child: Text(uc)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(width: 24, child: Text('$temp3°')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 10),
                        child: SizedBox(width: 20, child: icon3),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(width: 70, child: Text(dort)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(width: 24, child: Text('$temp4°')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 10),
                        child: SizedBox(width: 20, child: icon4),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Card(
                  color: Colors.white24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(width: 70, child: Text(bes)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(width: 24, child: Text('$temp5°')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 10),
                        child: SizedBox(width: 20, child: icon5),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Şehir Ara':
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.search),
                              labelText: "Şehir Adı Giriniz"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Bos geçilemez";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            sehirAdi = value!;
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          late double lat;
                          late double lon;
                          late String sehir;
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                          }
                          var url = Uri.parse(
                              "http://api.openweathermap.org/geo/1.0/direct?q=${sehirAdi}&limit=5&appid=44f3081dbc2e800d5f210c838a1be1c0");
                          var response = await get(url);

                          if (response.statusCode == 200) {
                            String data = response.body;
                            var seciliSehir = jsonDecode(data);
                            try {
                              lat = seciliSehir[0]['lat'];
                              lon = seciliSehir[0]['lon'];
                              sehir = seciliSehir[0]['name'];
                            } catch (e) {
                              print("catc2 hataaa");
                            }
                          } else {
                            print("STATUS YOK MU NE?");
                          }
                          WeatherDate weatherDate =
                              new WeatherDate(lat: lat, long: lon);
                          await weatherDate.getCurrentTempeture();
                          if (weatherDate.currentTempature == null ||
                              weatherDate.currentCondition == null) {
                            print("apiden sıcaklık gelmdi");
                          }
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return mainScreen(
                              weatherDate: weatherDate,
                              gelenSehir: sehir,
                            );
                          }));
                        },
                        child: Text("Ara"))
                  ],
                ),
              );
            });

        break;
      case 'Çıkış Yap':
        break;
    }
  }

  contentBox(context) {
    final _formKey = GlobalKey<FormState>();
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Şehir Ara",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Şehir Adı Giriniz',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Bos geçilemez";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              sehirAdi = value!;
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 22,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                        }

                        //   var url = Uri.parse(
                        //      "http://api.openweathermap.org/geo/1.0/direct?q=${sehirAdi}&limit=5&appid=44f3081dbc2e800d5f210c838a1be1c0");
                        //  var response = await get(url);
                        //  if (response.statusCode == 200) {
                        //   String data = response.body;
                        //  var seciliSehir = jsonDecode(data);
                        //  try {
                        //    lat = seciliSehir[0]['lat'];
                        //    long = seciliSehir[0]['long'];
                        //   isim = seciliSehir[0]['name'];
                        // } catch (e) {
                        //  print("catc2 hataaa");
                        //}
                        // } else {
                        // print("STATUS YOK MU NE?");
                        // }
                      },
                      child: Text(
                        "Ara",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: Icon(Icons.panorama_horizontal_select_sharp))),
        ),
      ],
    );
  }
}
