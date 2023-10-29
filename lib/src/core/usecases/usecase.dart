import 'package:tdd_tutorial/src/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams(); //rende const l'oggetto che andrò a instanz nelle sottocolassi
  ResultFuture<Type> call();
}
