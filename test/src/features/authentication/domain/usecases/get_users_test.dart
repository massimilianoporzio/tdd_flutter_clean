import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/repositories/auth_repo.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/usecases/get_users.dart';

//mi serve un fake repo
class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;
  //setup
  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()]; //lista con 1 utente vuoto

  test("should call [AuthRepo.getUsers] and return [List<User>]", () async {
    //ARRANGE
    when(
      () => repository.getUsers(),
    ).thenAnswer((invocation) async => const Right(tResponse));

    //ACT
    final result = await usecase();

    //ASSERT
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));

    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
