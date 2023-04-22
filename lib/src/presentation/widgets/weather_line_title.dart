// шапка для строки с данными
import 'package:flutter/material.dart';

class WeatherLineTitleInfo extends StatelessWidget {
  const WeatherLineTitleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('время'),
          Text('оС'),
          Text('влажность'),
          Text('ветер'),
        ],
      ),
    );
  }
}
