// проблемы с интернетом
class ConnectionError implements Exception {}

// проблемы с получением локации
class LocationError implements Exception {
  String message;
  LocationError({
    required this.message,
  });
}

// проблемы с получением данных о погоде
class WeatherError implements Exception {}
