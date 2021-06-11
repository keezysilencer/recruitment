import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/post_data.dart';

class PostBloc {
  final PostData postData;

  PostBloc(this.postData);

  Stream<List<Post>> posts() async* {
    final failureOrPosts = await postData(NoParams());
    yield* failureOrPosts.fold((f) async* {
      yield <Post>[];
    }, (posts) async* {
      yield posts;
    });
  }
}
