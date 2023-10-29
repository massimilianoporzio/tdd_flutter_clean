import 'package:dartz/dartz.dart';
import 'package:tdd_tutorial/src/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
