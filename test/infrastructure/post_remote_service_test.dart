import 'package:best_architecture_challenge/infrastructure/post_dto.dart';
import 'package:best_architecture_challenge/infrastructure/post_remote_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRemoteService extends Mock implements PostRemoteService {}

void main() {
  late MockPostRemoteService mockPostRemoteService;

  setUp(() => {
        mockPostRemoteService = MockPostRemoteService(),
      });

  group('Post remote repository test', () {
    test('fetch remote data success', () async {
      final postDTO = PostDTO(id: 1, title: 'title', body: 'body');
      when(() => mockPostRemoteService.fetchPost())
          .thenAnswer((_) async => [postDTO]);

      final result = await mockPostRemoteService.fetchPost();

      // Check if it return List<PostDTO>
      expect(result, [postDTO]);

      verify(() => mockPostRemoteService.fetchPost()).called(1);
    });
    test('fetch remote data failure', () async {
      when(() => mockPostRemoteService.fetchPost()).thenThrow(Exception());

      // Check if it return Exception
      expect(
          () => mockPostRemoteService.fetchPost(), throwsA(isA<Exception>()));

      verify(() => mockPostRemoteService.fetchPost()).called(1);
    });
  });
}
