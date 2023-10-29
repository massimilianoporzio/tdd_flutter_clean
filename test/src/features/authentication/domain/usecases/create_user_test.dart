import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/repositories/auth_repo.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/usecases/create_user.dart';

import 'authentication_repository_mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  //called before each test;
  setUp(() {
    repository = MockAuthRepo(); //mi serve un fake repo
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empyty();
  test('should call the [AuthRepository.createUser] method', () async {
    //Arrange
    //STUB
    when(
      () => repository.createUser(
        name: any(named: 'name'),
        createdAt: any(named: 'createdAt'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer((invocation) async => const Right(null));

    //Act
    final result = await usecase(params);

    //Assert
    expect(
        result,
        const Right<dynamic, void>(
            null)); //mi aspetto mi ritorni una right con dentro null
    //e controllo che repo sia stato chiamato UNA volta
    verify(
      () => repository.createUser(
          name: params.name,
          createdAt: params.createdAt,
          avatar: params.avatar),
    ).called(1);

    //E NON ci siano state altre interazioni con il repo
    verifyNoMoreInteractions(repository);
  });
}
