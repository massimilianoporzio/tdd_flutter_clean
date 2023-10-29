import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/src/features/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/features/authentication/domain/entities/user.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  final tModelFixture = const UserModel.empty().copyWith(
      createdAt: "2023-10-28T21:52:34.046Z",
      name: "Daryl Nitzsche I",
      avatar:
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/14.jpg",
      id: "1");

  test("should return a [User] entity", () {
    //ARRANGE

    //ACT
    final result = tModel.toEntity();
    //ASSERT
    expect(result, isA<User>());
  });

  final tJson = fixture("user.json"); //String da file json "fixture"
  final tMap = jsonDecode(tJson) as Map<String, dynamic>;

  group("fromEntity", () {
    const tUser = User.empty();
    test("should return a [UserModel] with the right data", () {
      //ACT
      final result = UserModel.fromEntity(tUser);
      //ASSERT
      expect(result, isA<UserModel>());
      expect(result, equals(const UserModel.empty()));
    });
  });

  group("fromMap", () {
    test("should return a [UserModel] with the right data", () {
      //ACT
      final result = UserModel.fromMap(tMap);
      expect(result, isA<UserModel>()); //che sia un UserModel
      expect(result, equals(tModelFixture));
    });
  });

  group("fromJson", () {
    test("should return a [UserModel] with the right data", () {
      //ACT
      final result = UserModel.fromJson(tJson);
      expect(result, isA<UserModel>()); //che sia un UserModel
      expect(result, equals(tModelFixture));
    });
  });

  group("toMap", () {
    test("should return a [Map] with the right data", () {
      //ACT
      final result = tModelFixture.toMap();
      expect(result, isA<Map<String, dynamic>>()); //che sia una Map
      expect(result, equals(tMap));
    });
  });

  group("toJson", () {
    test("should return a [String] in json format with the right data", () {
      //ARRANGE
      final tJson = jsonEncode({
        "createdAt": "2023-10-28T21:52:34.046Z",
        "name": "Daryl Nitzsche I",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/14.jpg",
        "id": "1"
      });
      //ACT
      final result = tModelFixture.toJson();
      expect(result, isA<String>()); //che sia una String
      expect(result, equals(tJson));
    });
  });
}
