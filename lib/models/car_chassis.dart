import 'car.dart';
import 'enums.dart';

class CarChassis {
  final CarChassisType type;
  final String description;
  final Map<int, Car> divisions;

  const CarChassis({
    required this.type,
    required this.description,
    required this.divisions,
  });

  Car operator [](int division) => divisions[division]!;
}