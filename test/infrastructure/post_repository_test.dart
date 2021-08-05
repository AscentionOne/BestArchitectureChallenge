import 'package:best_architecture_challenge/domain/post.dart';
import 'package:best_architecture_challenge/domain/post_failure.dart';
import 'package:best_architecture_challenge/infrastructure/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  late MockPostRepository mockPostRepository;

  setUp(() => {
        mockPostRepository = MockPostRepository(),
      });

  group('Post repository test', () {
    test('fetch data success', () async {
      final post = Post(id: '1', title: 'title', body: 'body');
      when(() => mockPostRepository.fetchPost())
          .thenAnswer((_) async => Right([post]));

      final result = await mockPostRepository.fetchPost();

      // Check if it return right
      expect(result.isRight(), true);

      // Check the returned right value is actually a List<Post>>
      // identity -> a function that returns its own parameter
      // we can also write like this expect(result.fold((l) => l, (r) => r), isA<List<Post>>());
      expect(result.fold(id, id), isA<List<Post>>());

      verify(() => mockPostRepository.fetchPost()).called(1);
    });
    test('fetch data failure', () async {
      when(() => mockPostRepository.fetchPost())
          .thenAnswer((data) async => left(PostFailure.api('')));

      final result = await mockPostRepository.fetchPost();

      // Check if it return left
      expect(result.isLeft(), true);

      expect(result.fold(id, id), isA<PostFailure>());

      verify(() => mockPostRepository.fetchPost()).called(1);
    });
  });
}
