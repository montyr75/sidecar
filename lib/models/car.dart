import 'enums.dart';

class Car {
  final CarChassisType chassis;
  final int division;
  final Map<Location, List<String>> locs;

  const Car({
    required this.chassis,
    required this.division,
    required this.locs,
  });

  int get ap => division;
  int get bp => division * 4;
  int get cp => division;

  @override
  String toString() => "$chassis (Division $division)";
}