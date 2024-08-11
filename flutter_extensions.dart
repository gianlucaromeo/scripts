import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This file contains useful Flutter extensions project:
///
/// - [CustomCases] for converting "camelCase" to "Spaced Title Case".
///
/// - [SizedBoxFromDouble] for creating [SizedBox] with a double value.
///
/// - [DurationFromInt] for creating [Duration] with an integer value.
///
/// - [PaddingFromDouble] for creating [EdgeInsets] with a double value.
///
/// - [PaddingFromListDouble] for creating [EdgeInsets] with a (list of) double
///   value(s).
///
/// - [AlignmentUtils] for checking the alignment of an [Alignment] object.
///
/// - [ValidAsyncSnapshot] for checking the state of an [AsyncSnapshot].
///
/// - [AsyncSnapshotErrorToString] for getting the error message from an
///   [AsyncSnapshot].
///
/// - [LocaleProviderFromContext] for getting the [LocaleProvider] from the
///   context.
///
/// - [TodayDateWithHours] for getting the current date with a specific hour.
///
/// - [SameHourMinuteSecond] for checking if two [DateTime] objects have the
///   same hour, minute, or second.


extension CustomCases on String {
  String get camelCaseToSpacedTitleCase {
    return split(RegExp("(?=[A-Z])"))
        .map((word) => "${word[0].toUpperCase()}${word.substring(1)}")
        .join(" ");
  }
}

extension SizedBoxFromDouble on double {
  get verticalSpace => SizedBox(height: this);
  get horizontalSpace => SizedBox(width: this);
}

extension DurationFromInt on int {
  get seconds => Duration(seconds: this);
  get milliseconds => Duration(milliseconds: this);
}

extension PaddingFromDouble on double {
  get all => EdgeInsets.all(this);
  get horizontal => EdgeInsets.symmetric(horizontal: this);
  get vertical => EdgeInsets.symmetric(vertical: this);
  get onlyBottom => EdgeInsets.only(bottom: this);
  get onlyTop => EdgeInsets.only(top: this);
  get onlyRight => EdgeInsets.only(right: this);
  get onlyLeft => EdgeInsets.only(left: this);
}

extension PaddingFromListDouble on List<double> {
  get fromLTRB {
    if (length == 4) {
      return EdgeInsets.fromLTRB(this[0], this[1], this[2], this[3]);
    }
    // TODO Add exception
    return EdgeInsets.zero;
  }

  get verticalHorizontal {
    if (length == 2) {
      return EdgeInsets.symmetric(vertical: this[0], horizontal: this[1]);
    }
    // TODO Add exception
    return EdgeInsets.zero;
  }
}

extension AlignmentUtils on Alignment {
  /* Vertical */
  bool get isTop => y == -1.0;
  bool get isVerticalCenter => y == 0.0;
  bool get isBottom => y == 1.0;

  /* Horizontal */
  bool get isLeft => x == -1.0;
  bool get isHorizontalCenter => x == 0.0;
  bool get isRight => x == 1.0;

  bool get isTopLeft => isTop && isLeft;
  bool get isTopCenter => isTop && isHorizontalCenter;
  bool get isTopRight => isTop && isRight;
  bool get isCenterLeft => isVerticalCenter && isLeft;
  bool get isCenter => isVerticalCenter && isHorizontalCenter;
  bool get isCenterRight => isVerticalCenter && isRight;
  bool get isBottomLeft => isBottom && isLeft;
  bool get isBottomCenter => isBottom && isHorizontalCenter;
  bool get isBottomRight => isBottom && isRight;

  double get vOffset {
    return y;

    // OR
    if (isTop) return -1.0; // y
    if (isVerticalCenter) return 0.0; // y
    if (isBottom) return 1.0; // y
    return 1.0;
  }

  double get hOffset {
    return x;

    // OR
    if (isLeft) return -1.0; // x
    if (isHorizontalCenter) return 0.0; // x
    if (isRight) return 1.0; // x
    return 1.0;
  }

  String get name {
    if (isTopLeft) return "Top Left";
    if (isTopCenter) return "Top Center";
    if (isTopRight) return "Top Right";
    if (isCenterLeft) return "Center Left";
    if (isCenter) return "Center";
    if (isCenterRight) return "Center Right";
    if (isBottomLeft) return "Bottom Left";
    if (isBottomCenter) return "Bottom Center";
    if (isBottomRight) return "Bottom Right";
    throw Exception("Cannot detect the correct alignment.");
  }
}

extension ValidAsyncSnapshot on AsyncSnapshot {
  bool get isDone => connectionState == ConnectionState.done;
  bool get isWaiting => connectionState == ConnectionState.waiting;
  bool get isValid => isDone && hasData;
}

extension AsyncSnapshotErrorToString on AsyncSnapshot {
  String? get errorMessage => error?.toString();
}

extension LocaleProviderFromContext on BuildContext {
  LocaleProvider get localeProvider => Provider.of<LocaleProvider>(
        this,
        listen: false,
      );

  Locale get currentLocale => localeProvider.currentLocale;
}

extension TodayDateWithHours on int {
  DateTime get todayAt {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      this, // The hour.
      0,
      0,
    );
  }
}

extension SameHourMinuteSecond on DateTime {
  bool sameHour(DateTime dt) {
    return hour == dt.hour;
  }

  bool sameMinute(DateTime dt) {
    return minute == dt.minute;
  }

  bool sameSecond(DateTime dt) {
    return second == dt.second;
  }

  bool sameTime(DateTime dt) {
    return sameSecond(dt) && sameMinute(dt) && sameHour(dt);
  }
}
