import 'package:best_architecture_challenge/application/post/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostBloc>().state;
    return state.postStatus.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      success: () => ListView.separated(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          String id = state.posts[index].id;
          String title = state.posts[index].title;
          String body = state.posts[index].body;
          return Container(
            padding: EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "$id. $title",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  TextSpan(
                    text: '\n' + body,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      failure: () => Center(
        child: Text(
          'Failed to fetch posts',
          key: Key('__failureTextMessage__'),
        ),
      ),
    );
  }
}
