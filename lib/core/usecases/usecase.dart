import 'package:clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> create(Params params);
  Future<Either<Failure, Type>> read();
  Future<Either<Failure, Type>> update(Params params);
  Future<Either<Failure, Type>> delete(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
