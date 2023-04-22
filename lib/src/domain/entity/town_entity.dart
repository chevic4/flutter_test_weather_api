// точка во времени с данными о погоде в ней
class WeatherEntity {
  final DateTime dateTime;
  final double temperature_2m;
  final int relativehumidity_2m;
  final double windspeed_10m;

  WeatherEntity({
    required this.dateTime,
    required this.temperature_2m,
    required this.relativehumidity_2m,
    required this.windspeed_10m,
  });
}
