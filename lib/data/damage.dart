import '../models/enums.dart';
import '../models/internal_damage_item.dart';
import '../models/internal_damage_sequence.dart';

const Map<InternalDamageCarSize, List<InternalDamageSequence>> internalDamageSequences = {
  InternalDamageCarSize.small: [
    InternalDamageSequence(
      cardId: "A1",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.fire, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "A2",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.crew, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "A3",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.tires, limit: 2),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.gunner, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "A4",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.crew, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "A5",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.oppositeArmor, limit: 3),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.driver, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "A6",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
  ],
  InternalDamageCarSize.big: [
    InternalDamageSequence(
      cardId: "B1",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.tires, limit: 2),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "B2",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.fire, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.tires, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 2),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "B3",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "B4",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.oppositeArmor, limit: 5),
        InternalDamageItem(loc: InternalDamageLocation.fire, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.crew, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "B5",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.driver, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
    InternalDamageSequence(
      cardId: "B6",
      items: [
        InternalDamageItem(loc: InternalDamageLocation.structure),
        InternalDamageItem(loc: InternalDamageLocation.weapon, limit: 2),
        InternalDamageItem(loc: InternalDamageLocation.accessory, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.gunner, limit: 1),
        InternalDamageItem(loc: InternalDamageLocation.powerPlant),
      ],
    ),
  ],
};

enum InternalDamageCarSize {
  small,
  big,
}