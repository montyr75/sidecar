import 'package:meta/meta.dart';

import 'enums.dart';

@immutable
class InternalDamageItem {
  final InternalDamageLocation loc;
  final int limit;

  const InternalDamageItem({required this.loc, this.limit = 0});

  @override
  String toString() => "$loc (${formatLimit()}";

  String formatLimit() {
    String limitOutput;

    if (limit == 0) {
      limitOutput = "No Limit";
    }
    else if (loc == InternalDamageLocation.fire) {
      limitOutput = "Start 1 Fire";
    }
    else {
      limitOutput = "Limit $limit";
    }

    return limitOutput;
  }
}


