import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String? errorMessage(e) {
    if (e is AppFailure) {
      return e.message;
    }
  }
}

// General failures
class AppFailure extends Failure {
  final String? message;

  AppFailure(this.message);
}

class CacheFailure extends Failure {}
