// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tdd_tutorial/src/core/usecases/usecase.dart';

import '../../../../core/utils/typedef.dart';
import '../repositories/auth_repo.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _repository;
  CreateUser(
    this._repository,
  );
  ResultVoid createUser({
    required String name,
    required String createdAt,
    required String avatar,
  }) async =>
      _repository.createUser(
        name: name,
        createdAt: createdAt,
        avatar: avatar,
      );

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        name: params.name,
        createdAt: params.createdAt,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String name;
  final String createdAt;
  final String avatar;

  const CreateUserParams({
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  //empty params
  const CreateUserParams.empyty()
      : this(
          avatar: "",
          createdAt: "",
          name: "",
        );

  @override
  List<Object> get props => [name, createdAt, avatar];
}
