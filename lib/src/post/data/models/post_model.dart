import '../../domain/entities/post.dart';

class UserModel extends User {
  UserModel(
      {required String id,
      required String title,
      required String firstName,
      required String lastName,
      required String email,
      required String picture})
      : super(
            firstName: firstName,
            id: id,
            title: title,
            lastName: lastName,
            email: email,
            picture: picture);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json['firstName'],
        title: json['title'],
        id: json['id'],
        lastName: json['lastName'],
        email: json['email'],
        picture: json['picture']);
  }

  factory UserModel.initial() => UserModel(
      firstName: "",
      title: 'susu',
      id: '',
      lastName: '0.0',
      email: '',
      picture: '');
}

class PostModel extends Post {
  PostModel(
      {required String id,
      required String image,
      required int likes,
      required String publishDate,
      required List<String> tags,
      required String text,
      required UserModel user})
      : super(
            likes: likes,
            id: id,
            image: image,
            publishDate: publishDate,
            tags: tags,
            text: text,
            user: user);

  factory PostModel.fromJson(Map<dynamic, dynamic> json) {
    return PostModel(
        likes: json['likes'],
        image: json['image'],
        id: json['id'],
        publishDate: json['publishDate'],
        tags: json['tags'].cast<String>(),
        text: json['text'],
        user: UserModel.fromJson(json['owner']));
  }

  factory PostModel.initial() => PostModel(
      likes: 10,
      image: 'image.com',
      id: '',
      publishDate: '0.0',
      tags: [],
      text: '',
      user: UserModel.initial());
}
