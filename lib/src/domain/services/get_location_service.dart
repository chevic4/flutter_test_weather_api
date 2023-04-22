import 'package:either_dart/either.dart';
import 'package:flutter_weather_app_test/errors/errors.dart';
import 'package:flutter_weather_app_test/src/data/data_source/location_get_impl.dart';
import 'package:flutter_weather_app_test/src/data/models/town_location_model.dart';

// вообще так делать не надо в Data/repository я описал почему

class LocationService {
  final repositoryGetLocation = LocationDataSourseImpl();

  Future<Either<TownLocationModel, LocationError>> getLocation(
      String nameTown) async {
    final result = await repositoryGetLocation.getTownLocation(nameTown);
    return result;
  }
}
