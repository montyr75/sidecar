import 'enums.dart';
import 'vehicle.dart';

class CarChassis {
  final ChassisType type;
  final String description;
  final Map<int, Vehicle> divisions;

  const CarChassis({
    required this.type,
    required this.description,
    required this.divisions,
  });

  Vehicle operator [](int division) => divisions[division]!;
}