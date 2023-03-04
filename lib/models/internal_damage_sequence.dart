import 'package:meta/meta.dart';

import 'internal_damage_item.dart';

@immutable
class InternalDamageSequence {
  final String cardId;
  final List<InternalDamageItem> items;

  const InternalDamageSequence({required this.cardId, required this.items});

  @override
  String toString() {
    final sb = StringBuffer();

    for (int i = 0; i < items.length; i++) {
      sb.writeln("${i + 1} > ${items[i]}");
    }

    return sb.toString();
  }
}