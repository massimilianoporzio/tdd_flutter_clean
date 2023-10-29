import 'package:tdd_tutorial/src/core/utils/typedef.dart';

import '../entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String name,
    required String createdAt,
    required String avatar,
  });

  //tutti gli utenti
  ResultFuture<List<User>> getUsers();
}
