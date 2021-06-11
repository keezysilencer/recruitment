import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/data/static_data.dart';
import '../../../../core/error/exception.dart';
import '../models/post_model.dart';

abstract class PostRemoteDatabase {
  /// Calls the [RemoteApi.endpoint]={posts(page:1,limit:10){ data {id image likes} }} endpoint.
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<PostModel>> postDataRequest();
}

class PostRemoteDatabaseImpl implements PostRemoteDatabase {
  final http.Client client;

  PostRemoteDatabaseImpl(this.client);

  String query = """
    { posts(page:1, limit: 20){
      data  {
             id
             image
             likes
             link
             publishDate
             tags
             text
          owner {
                   id
                   title
                   firstName
                   lastName
                   email
                   picture
                }
       }
    }}
      """;

  @override
  Future<List<PostModel>> postDataRequest() async {
    try {
      final response = await client.get(
          Uri.parse('${RemoteApi.endpoint}=$query'),
          headers: {"app-id": RemoteApi.appID});
      if (response.statusCode == 200) {
        final posts = json.decode(response.body);
        return posts['data']['posts']['data']
            .map<PostModel>((post) => PostModel.fromJson(post))
            .toList();
      } else {
        throw ServerException.fromJson(json.decode(response.body),
            code: response.statusCode);
      }
    } on http.ClientException {
      throw ServerException("Unexpected error! Try again.");
    }
  }
}
