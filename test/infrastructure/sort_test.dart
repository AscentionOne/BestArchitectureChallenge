import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:best_architecture_challenge/domain/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sort test', () {
    test('sort by Id test', () async {
      final postsSortByIdResult = [
        Post(id: '1', title: 'A big apple', body: 'body1'),
        Post(id: '2', title: 'Sunny day', body: 'body2'),
      ];
      final posts = [
        Post(id: '2', title: 'Sunny day', body: 'body2'),
        Post(id: '1', title: 'A big apple', body: 'body1'),
      ];

      final result = sortById(posts);

      expect(result, postsSortByIdResult);
    });
    test('sort by Title test', () async {
      final postsSortByTitleResult = [
        Post(id: '2', title: 'A big apple', body: 'body2'),
        Post(id: '1', title: 'Sunny day', body: 'body1'),
      ];
      final posts = [
        Post(id: '1', title: 'Sunny day', body: 'body1'),
        Post(id: '2', title: 'A big apple', body: 'body2'),
      ];

      final result = sortByTitle(posts);

      expect(result, postsSortByTitleResult);
    });
  });
}
