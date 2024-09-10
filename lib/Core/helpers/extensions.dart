import 'package:flutter/widgets.dart';
import 'package:tasky_app/Core/helpers/enums.dart';

//navigation________________________________________
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}





//MediaQuery_________________________________________________
extension MediaQueryValues on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenPaddingTop => MediaQuery.of(this).padding.top;
  double get screenPaddingBottom => MediaQuery.of(this).padding.bottom;
  double get screenPaddingLeft => MediaQuery.of(this).padding.left;
  double get screenPaddingRight => MediaQuery.of(this).padding.right;
  double get screenPixelRatio => MediaQuery.of(this).devicePixelRatio;
  Orientation get screenOrientation => MediaQuery.of(this).orientation;
}




//priority enum_________________________________________________________
extension PriorityExtension on Priority {
  String get displayName {
    switch (this) {
      case Priority.low:
        return "Low priority";
      case Priority.medium:
        return "Medium priority";
      case Priority.high:
        return "High priority";
    }
  }

  String get apiValue {
    switch (this) {
      case Priority.low:
        return "low";
      case Priority.medium:
        return "medium";
      case Priority.high:
        return "high";
    }
  }

  static Priority fromApiValue(String value) {
    switch (value) {
      case "low":
        return Priority.low;
      case "medium":
        return Priority.medium;
      case "high":
        return Priority.high;
      default:
        throw ArgumentError("Invalid Priority value");
    }
  }
}


//status enum______________________________________
extension StatusExtension on Status {
  String get displayName {
    switch (this) {
      case Status.waiting:
        return "Waiting";
      case Status.finished:
        return "Finished";
      case Status.inProgress:
        return "In Progress";
    }
  }

  String get apiValue {
    switch (this) {
      case Status.waiting:
        return "waiting";
      case Status.finished:
        return "finished";
      case Status.inProgress:
        return "inProgress";
    }
  }

  static Status fromApiValue(String value) {
    switch (value) {
      case "waiting":
        return Status.waiting;
      case "finished":
        return Status.finished;
      case "inProgress":
        return Status.inProgress;
      default:
        throw ArgumentError("Invalid Status value");
    }
  }
}