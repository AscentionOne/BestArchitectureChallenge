import 'dart:async';

import 'package:best_architecture_challenge/domain/post.dart';
import 'package:best_architecture_challenge/infrastructure/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this._postRepository) : super(PostState.initial());

  final PostRepository _postRepository;

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    yield* event.map(
      postFetched: (e) async* {
        final failureOrSuccess = await _postRepository.fetchPost();

        yield failureOrSuccess.fold(
          (failure) => state.copyWith(postStatus: PostStatus.failure()),
          (posts) => state.copyWith(
            postStatus: PostStatus.success(),
            posts: posts,
          ),
        );
      },
      postFilteredById: (e) async* {
        yield state.copyWith(
          postStatus: PostStatus.loading(),
        );
        final filteredPosts = sortById(state.posts);

        yield state.copyWith(
          postStatus: PostStatus.success(),
          posts: filteredPosts,
        );
      },
      postFilteredByTitle: (e) async* {
        yield state.copyWith(
          postStatus: PostStatus.loading(),
        );
        final filteredPosts = sortByTitle(state.posts);

        yield state.copyWith(
          postStatus: PostStatus.success(),
          posts: filteredPosts,
        );
      },
    );
  }
}

List<Post> sortById(List<Post> posts) {
  return posts..sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
}

List<Post> sortByTitle(List<Post> posts) {
  return posts..sort((a, b) => a.title.compareTo(b.title));
}
