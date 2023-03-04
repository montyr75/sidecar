import 'package:flutter/material.dart';

import '../data/damage.dart';
import '../models/internal_damage_sequence.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';

class InternalDamageSequenceDisplay extends StatelessWidget {
  static const Map<InternalDamageCarSize, Map<String, TextStyle>> styles = {
    InternalDamageCarSize.small: {
      'loc': TextStyle(
        color: Colors.yellow,
        fontSize: 16,
      ),
      'number': TextStyle(
        color: Colors.green,
        fontSize: 16,
      ),
      'limit': TextStyle(
        color: Colors.green,
        fontSize: 12,
      ),
    },
    InternalDamageCarSize.big: {
      'loc': TextStyle(
        color: Colors.yellow,
        fontSize: 16,
      ),
      'number': TextStyle(
        color: Color(0xFFF3830D),
        fontSize: 16,
      ),
      'limit': TextStyle(
        color: Color(0xFFF3830D),
        fontSize: 12,
      ),
    },
  };

  final InternalDamageSequence seq;
  final InternalDamageCarSize size;

  const InternalDamageSequenceDisplay({
    Key? key,
    required this.seq,
    this.size = InternalDamageCarSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.grey[900]!,
          width: 5,
        ),
        borderRadius: radiusXL,
      ),
      child: Container(
        width: 300,
        height: 160,
        decoration: BoxDecoration(
          color: size == InternalDamageCarSize.small
              ? const Color(0xFF032506)
              : const Color(0xFF55340D),
        ),
        child: Padding(
          padding: paddingAllXL,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < seq.items.length; i++)
                Row(
                  children: [
                    Text(
                      "${i + 1} > ",
                      style: styles[size]!['number'],
                    ),
                    Text(
                      seq.items[i].loc.toString(),
                      style: styles[size]!['loc'],
                    ),
                    const Spacer(),
                    Text(
                      seq.items[i].formatLimit(),
                      style: styles[size]!['limit'],
                    ),
                  ],
                ),
            ].joinWidgetList(boxS).toList(),
          ),
        ),
      ),
    );
  }
}
