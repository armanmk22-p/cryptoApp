
import 'dart:async';

import 'package:crypto_app_zero/model/crypto_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'coin_list_screen.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      getData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                Text('Crypto App',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                color:greenColor),),
                SpinKitWave(
                  color: Colors.white,
                  size: 30.0,
                ),
              ],
            )),
      ),
    );
  }

  Future<void> getData() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');
    List<CryptoModel> cryptoList = response.data['data']
        .map<CryptoModel>((e) => CryptoModel.fromMapJson(e))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoinListScreen(
          cryptoList: cryptoList,
        ),
      ),
    );
  }
}
