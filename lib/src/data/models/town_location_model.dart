import 'dart:convert';

// на основании этих данных будем
// будем идти в апи за погодой
// вообще конечно её надо делать из domain
// поскольку оттуда эти данные приходят
// приобразовывать mapper в эту сущность и работать с ней
// но чтоб не загромождать код решил сформировать её в  domain сразу

class TownLocationModel {
  String name;
  double latitude;
  double longitude;

  TownLocationModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory TownLocationModel.fromMap(Map<String, dynamic> map) {
    return TownLocationModel(
      name: map['state'] ?? '',
      latitude: map['lat'] ?? '',
      longitude: map['lon'] ?? '',
    );
  }

  factory TownLocationModel.fromJson(String source) =>
      TownLocationModel.fromMap(json.decode(source));
}
