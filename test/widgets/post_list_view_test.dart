import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:best_architecture_challenge/domain/post.dart';
import 'package:best_architecture_challenge/presentation/post_list_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostBloc extends MockBloc<PostEvent, PostState> implements PostBloc {}

class FakePostState extends Fake implements PostState {}

class FakePostEvent extends Fake implements PostEvent {}

void main() {
  setUpAll(() => {
        registerFallbackValue<PostState>(FakePostState()),
        registerFallbackValue<PostEvent>(FakePostEvent()),
      });

  late MockPostBloc mockPostBloc;

  setUp(() {
    mockPostBloc = MockPostBloc();
  });

  final post = Post(id: '1', title: 'title', body: 'body');

  group('PostListView Widget Test', () {
    testWidgets('render circular progress indicator when postState is initial',
        (widgetTester) async {
      when(() => mockPostBloc.state).thenReturn(PostState.initial());
      await widgetTester.pumpWidget(
        BlocProvider<PostBloc>(
          create: (_) => mockPostBloc,
          child: MaterialApp(
            home: PostListView(),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('render ListView when postStatus is success',
        (widgetTester) async {
      when(() => mockPostBloc.state).thenReturn(
          PostState(postStatus: PostStatus.success(), posts: [post]));
      await widgetTester.pumpWidget(
        BlocProvider<PostBloc>(
          create: (_) => mockPostBloc,
          child: MaterialApp(
            home: PostListView(),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('render error Text when postStatus is failure',
        (widgetTester) async {
      when(() => mockPostBloc.state)
          .thenReturn(PostState(postStatus: PostStatus.failure(), posts: []));
      await widgetTester.pumpWidget(
        BlocProvider<PostBloc>(
          create: (_) => mockPostBloc,
          child: MaterialApp(
            home: PostListView(),
          ),
        ),
      );
      await widgetTester.pumpAndSettle();
      expect(find.byKey(Key('__failureTextMessage__')), findsOneWidget);
    });
  });
}
