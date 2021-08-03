import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:best_architecture_challenge/core/injectable.dart';
import 'package:best_architecture_challenge/presentation/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PostBloc>()..add(PostEvent.postFetched()),
        ),
      ],
      child: MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: PostPage(title: 'FlutterTaipei :)'),
      ),
    );
  }
}
