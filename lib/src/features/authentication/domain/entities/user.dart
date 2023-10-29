import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User extends Equatable {
  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const User.empty()
      : this(
          id: -1,
          avatar: "",
          createdAt: "",
          name: "",
        );

  @override
  List<Object> get props => [id]; //basta l'id a IDENTIFICARE l'utente
}
