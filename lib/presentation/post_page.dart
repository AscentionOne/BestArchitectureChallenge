import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:best_architecture_challenge/presentation/post_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('使用id排序'),
                onTap: () {
                  context.read<PostBloc>().add(PostEvent.postFilteredById());
                },
              ),
              PopupMenuItem(
                child: Text('使用title排序'),
                onTap: () {
                  context.read<PostBloc>().add(PostEvent.postFilteredByTitle());
                },
              )
            ],
          )
        ],
      ),
      body: const PostListView(),
    );
  }
}
