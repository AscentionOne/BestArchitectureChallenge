import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:best_architecture_challenge/domain/post.dart';
import 'package:best_architecture_challenge/domain/post_failure.dart';
import 'package:best_architecture_challenge/infrastructure/post_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockPostRepository;

  setUp(() => {
        mockPostRepository = MockPostRepository(),
      });
  group('Post bloc test', () {
    late PostBloc postBloc;

    setUp(() => {
          postBloc = PostBloc(mockPostRepository),
        });

    final post = Post(id: '1', title: 'title', body: 'body');

    blocTest<PostBloc, PostState>(
      'emits PostState when success',
      build: () {
        when(() => mockPostRepository.fetchPost())
            .thenAnswer((_) async => Right([post]));

        return postBloc;
      },
      act: (bloc) => bloc.add(PostEvent.postFetched()),
      expect: () => [
        PostState(postStatus: PostStatus.success(), posts: [post])
      ],
      verify: (_) => verify(() => mockPostRepository.fetchPost()).called(1),
    );
    blocTest<PostBloc, PostState>(
      'emits PostState when failure',
      build: () {
        when(() => mockPostRepository.fetchPost())
            .thenAnswer((data) async => left(PostFailure.api('')));

        return postBloc;
      },
      act: (bloc) => bloc.add(PostEvent.postFetched()),
      expect: () => [PostState(postStatus: PostStatus.failure(), posts: [])],
      verify: (_) => verify(() => mockPostRepository.fetchPost()).called(1),
    );
    blocTest<PostBloc, PostState>(
      'emits PostState when postFilteredById',
      build: () => postBloc,
      act: (bloc) => bloc.add(PostEvent.postFilteredById()),
      expect: () => [
        PostState(postStatus: PostStatus.loading(), posts: []),
        PostState(postStatus: PostStatus.success(), posts: []),
      ],
    );
    blocTest<PostBloc, PostState>(
      'emits PostState when postFilteredByTitle',
      build: () => postBloc,
      act: (bloc) => bloc.add(PostEvent.postFilteredByTitle()),
      expect: () => [
        PostState(postStatus: PostStatus.loading(), posts: []),
        PostState(postStatus: PostStatus.success(), posts: []),
      ],
    );

    tearDown(() => postBloc.close());
  });
}
