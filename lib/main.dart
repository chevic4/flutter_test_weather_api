import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_weather_app_test/src/application.dart';
import 'package:flutter_weather_app_test/src/config/route/app_routes.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child: const Application(),
  ));
}

// https://openweathermap.org/api/hourly-forecast