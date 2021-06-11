import 'package:equatable/equatable.dart';
/// User entity
class User extends Equatable {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String picture;


  User({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.picture});

  @override
  List<Object> get props =>
      [ title, id, firstName, lastName, email, picture];
}

/// Post entity
class Post extends Equatable {
  final String id;
  final String image;
  final int likes;
  final String publishDate;
  final List<String> tags;
  final String text;
  final User user;


  Post({required this.likes,
    required this.id,
    required this.image,
    required this.publishDate,
    required this.tags,
    required this.text,
    required this.user});

  @override
  List<Object> get props =>
      [likes, image, id, publishDate, tags, text, user];
}


