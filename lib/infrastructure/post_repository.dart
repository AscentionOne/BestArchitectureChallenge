import 'package:best_architecture_challenge/domain/post.dart';
import 'package:best_architecture_challenge/domain/post_failure.dart';
import 'package:best_architecture_challenge/infrastructure/post_remote_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostRepository {
  final PostRemoteService _remoteService;

  PostRepository(this._remoteService);

  Future<Either<PostFailure, List<Post>>> fetchPost() async {
    try {
      final postList = await _remoteService.fetchPost();
      final post = postList.map((post) => post.toDomain()).toList();

      return right(post);
    } catch (e) {
      //* log error or return error message
      return left(PostFailure.api(e.toString()));
    }
  }
}
