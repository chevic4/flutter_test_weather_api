// создал модельку здесь
// https://jsontodart.in
// и доработал
// построил на конструкторах ну и
// убрал что не нужно

class WeatherDataModel {
  WeatherDataModel({
    required this.time,
    required this.temperature_2m,
    required this.relativehumidity_2m,
    required this.windspeed_10m,
  });
  final List<String> time;
  final List<num> temperature_2m;
  final List<int> relativehumidity_2m;
  final List<num> windspeed_10m;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
        time: List.castFrom<dynamic, String>(json['time']),
        temperature_2m: List.castFrom<dynamic, num>(json['temperature_2m']),
        relativehumidity_2m:
            List.castFrom<dynamic, int>(json['relativehumidity_2m']),
        windspeed_10m: List.castFrom<dynamic, num>(json['windspeed_10m']));
  }
}
