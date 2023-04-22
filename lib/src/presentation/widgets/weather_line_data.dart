// строка с данными
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_test/src/domain/entity/town_entity.dart';

class WeatherLineInfo extends StatelessWidget {
  const WeatherLineInfo({super.key, required this.data});
  final WeatherEntity data;

  @override
  Widget build(BuildContext context) {
    // всю дату показывать не будем
    // доделать формат отображения красивый потом
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_timeInfo(data.dateTime)),
          Text(data.temperature_2m.toString()),
          Text(data.relativehumidity_2m.toString()),
          Text(data.windspeed_10m.toString()),
        ],
      ),
    );
  }
}

// часы без дат покажем
String _timeInfo(DateTime val) {
  final hour = val.hour.toString().padLeft(2, '0');
  return '$hour:00';
}
