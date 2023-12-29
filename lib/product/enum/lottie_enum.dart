import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePath {
  splash;

  String get rawValue => "assets/lottie/$name.json";
  Widget toLottie() {
    return Lottie.asset(rawValue, height: 800, width: 600);
  }
}
