import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.name,
      required this.persona,
      required this.token,});

  final String id;
  final String token;
  final String name;
  final String persona;

  @override
  List<Object> get props => [id];

  static const empty = User(id: '', name: '', persona: '', token: '');
}
