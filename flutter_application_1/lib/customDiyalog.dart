import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/mainScreen.dart';
import 'package:flutter_application_1/utils/sabitler.dart';
import 'package:flutter_application_1/utils/weather.dart';
import 'package:http/http.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox({
    super.key,
    required this.title,
    required this.descriptions,
    required this.text,
  });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  late double lat;
  late double long;
  late String isim;
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  late String sehirAdi;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
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
                  widget.title,
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
                            controller: t1,
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

                        var url = Uri.parse(
                            "http://api.openweathermap.org/geo/1.0/direct?q=${sehirAdi}&limit=5&appid=44f3081dbc2e800d5f210c838a1be1c0");
                        var response = await get(url);
                        if (response.statusCode == 200) {
                          String data = response.body;
                          var seciliSehir = jsonDecode(data);
                          try {
                            lat = seciliSehir[0]['lat'];
                            long = seciliSehir[0]['long'];
                            isim = seciliSehir[0]['name'];
                          } catch (e) {
                            print("catc2 hataaa");
                          }
                        } else {
                          print("STATUS YOK MU NE?");
                        }
                      },
                      child: Text(
                        widget.text,
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
