part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const PostState._();
  const factory PostState({
    required PostStatus postStatus,
    required List<Post> posts,
  }) = _PostState;

  factory PostState.initial() =>
      PostState(postStatus: const PostStatus.loading(), posts: <Post>[]);
}

@freezed
class PostStatus with _$PostStatus {
  const PostStatus._();
  const factory PostStatus.loading() = _Loading;
  const factory PostStatus.success() = _Success;
  const factory PostStatus.failure() = _Failure;
}
