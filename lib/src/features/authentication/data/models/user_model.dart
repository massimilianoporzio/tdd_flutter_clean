// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/src/core/utils/mapper.dart';

import '../../domain/entities/user.dart';

class UserMapper extends DataMapper<User, UserModel> {
  @override
  User mapToEntity(UserModel model) {
    return User(
      id: int.tryParse(model.id) ?? -1,
      createdAt: model.createdAt,
      name: model.name,
      avatar: model.avatar,
    );
  }

  @override
  UserModel mapToModel(User entity) {
    return UserModel(
      id: entity.id.toString(),
      createdAt: entity.createdAt,
      name: entity.name,
      avatar: entity.avatar,
    );
  }
}

class UserModel extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  const UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromEntity(User user) {
    return UserMapper().mapToModel(user); //TODO fare singleton? get_it?
  }

  User toEntity() {
    return UserMapper().mapToEntity(this);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, name, avatar, createdAt];

  //EMPY MODEL
  const UserModel.empty() : this(avatar: "", createdAt: "", id: "-1", name: "");

  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
