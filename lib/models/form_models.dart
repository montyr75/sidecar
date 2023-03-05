import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum ValidationError {
  empty("This field is required."),
  invalid("Invalid entry."),
  invalidNewPassword("Password must contain at least 8 characters."),
  noMatchPassword("Password does not match."),
  outOfRange("Out of range.");

  final String errorMsg;

  const ValidationError(this.errorMsg);
}

/// Model for optional string form fields with unrestricted content. (Validator always validates.)
class StringFormField extends FormzInput<String, ValidationError> {
  const StringFormField.pure([String value = '']) : super.pure(value);
  StringFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) => null;

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  @override
  String toString() => value;

  String? get valueIfDirty => !pure ? value : null;

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;
}

/// Model for required string form fields with unrestricted content.
class RequiredStringFormField extends StringFormField {
  const RequiredStringFormField.pure([String value = '']) : super.pure(value);
  RequiredStringFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isNotEmpty ? null : ValidationError.empty;
  }
}

/// Model for required new password confirmation field.
class RequiredConfirmPasswordFormField extends StringFormField {
  final String match;

  const RequiredConfirmPasswordFormField.pure([String value = '', this.match = '']) : super.pure(value);
  RequiredConfirmPasswordFormField.dirty({required this.match, String value = ''}) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.trim() == match.trim() ? null : ValidationError.noMatchPassword;
  }
}

/// Model for required string form fields representing a new password for Appwrite.
class RequiredAppwriteNewPasswordFormField extends StringFormField {
  const RequiredAppwriteNewPasswordFormField.pure([String value = '']) : super.pure(value);
  RequiredAppwriteNewPasswordFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    final password = value.trim();

    if (password.isEmpty){
      return ValidationError.empty;
    }
    else if (password.length < 8) {
      return ValidationError.invalidNewPassword;
    }

    return null;
  }
}

/// Model for optional boolean form fields. (Validator always validates.)
class BoolFormField extends FormzInput<bool, ValidationError> {
  const BoolFormField.pure([bool value = false]) : super.pure(value);
  const BoolFormField.dirty([bool value = false]) : super.dirty(value);

  @override
  ValidationError? validator(bool? value) => null;
}

/// Model for required boolean form fields. (Validates only on true.)
class RequiredBoolFormField extends FormzInput<bool?, ValidationError> {
  const RequiredBoolFormField.pure([bool value = false]) : super.pure(value);
  const RequiredBoolFormField.dirty([bool value = false]) : super.dirty(value);

  @override
  ValidationError? validator(bool? value) => value != null && value ? null : ValidationError.empty;
}

/// Model for email form fields.
class EmailFormField extends FormzInput<String, ValidationError> {
  const EmailFormField.pure([String value = '']) : super.pure(value);
  EmailFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String? value) {
    return value == null || value.isEmpty || isEmail(value) ? null : ValidationError.invalid;
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isEmpty ? null : value;

  @override
  String toString() => value;
}

/// Model for required email form fields.
class RequiredEmailFormField extends FormzInput<String, ValidationError> {
  const RequiredEmailFormField.pure([String value = '']) : super.pure(value);
  RequiredEmailFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    if (value.isEmpty) {
      return ValidationError.empty;
    } else if (isEmail(value)) {
      return null;
    } else {
      return ValidationError.invalid;
    }
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;

  @override
  String toString() => value;
}

/// Model for optional int form fields.
class IntFormField extends FormzInput<String, ValidationError> {
  const IntFormField.pure([String value = '']) : super.pure(value);
  IntFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isEmpty || intValue != null ? null : ValidationError.invalid;
  }

  int? get intValue => int.tryParse(value);
}

/// Model for required int form fields.
class RequiredIntFormField extends FormzInput<String, ValidationError> {
  const RequiredIntFormField.pure([String value = '']) : super.pure(value);
  RequiredIntFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isEmpty || intValue == null ? ValidationError.invalid : null;
  }

  int? get intValue => int.tryParse(value);
}

/// Model for optional fully qualified domain name form fields.
class DomainFormField extends FormzInput<String, ValidationError> {
  const DomainFormField.pure([String value = '']) : super.pure(value);
  const DomainFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isEmpty || isFQDN(value, allowUnderscores: true) ? null : ValidationError.invalid;
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;
}

/// Model for required fully qualified domain name or IP form fields.
class RequiredDomainOrIpFormField extends FormzInput<String, ValidationError> {
  const RequiredDomainOrIpFormField.pure([String value = '']) : super.pure(value);
  RequiredDomainOrIpFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isNotEmpty && (isFQDN(value, allowUnderscores: true) || isIP(value)) ? null : ValidationError.invalid;
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;

  @override
  String toString() => value;
}

/// Model for optional URL form fields.
class URLFormField extends FormzInput<String, ValidationError> {
  const URLFormField.pure([String value = '']) : super.pure(value);
  const URLFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return value.isEmpty || isURL(value, allowUnderscore: true, requireProtocol: true, protocols: const ['http', 'https']) ? null : ValidationError.invalid;
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;
}

/// Model for required U.S. zip code form fields.
class RequiredZipCodeFormField extends FormzInput<String, ValidationError> {
  const RequiredZipCodeFormField.pure() : super.pure('');
  RequiredZipCodeFormField.dirty([String value = '']) : super.dirty(value);

  @override
  ValidationError? validator(String value) {
    return isPostalCode(value, "US") ? null : ValidationError.invalid;
  }

  // use this to avoid getting an empty string as a valid value
  String? get valueOrNull => value.isNotEmpty ? value : null;

  @override
  String toString() => value;
}

class IntRange {
  final int? min;
  final int? max;

  const IntRange({this.min, this.max});

  IntRange copyWith({int? min, int? max}) {
    return IntRange(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  bool isInRange(int value) {
    bool inRange = true;

    if (min != null) {
      inRange = inRange && value >= min!;
    }

    if (max != null) {
      inRange = inRange && value <= max!;
    }

    return inRange;
  }

  @override
  String toString() => "$min${max != null ? '-$max' : '+'}";

  bool get isEmpty => min == null && max == null;
  bool get isNotEmpty => !isEmpty;
}

class IntRangeFormField extends FormzInput<IntRange, ValidationError> {
  const IntRangeFormField.pure([IntRange value = const IntRange()]) : super.pure(value);
  IntRangeFormField.dirty(IntRange value) : super.dirty(value);

  @override
  ValidationError? validator(IntRange value) => null;

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => !isEmpty;
}