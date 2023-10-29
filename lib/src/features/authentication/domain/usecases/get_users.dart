// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tdd_tutorial/src/core/usecases/usecase.dart';
import 'package:tdd_tutorial/src/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/repositories/auth_repo.dart';

import '../entities/user.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  final AuthenticationRepository _repository;
  GetUsers(
    this._repository,
  );
  @override
  ResultFuture<List<User>> call() => _repository.getUsers();
}
