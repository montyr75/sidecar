import '../../models/vehicle.dart';

class SavedBuilds {
  final List<Vehicle> vehicles;

  const SavedBuilds([this.vehicles = const []]);

  factory SavedBuilds.fromData(List<Map<String, dynamic>> data) {
    return SavedBuilds(data.map((value) => Vehicle.fromJson(value)).toList());
  }
}