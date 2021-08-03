import 'dart:convert';

import 'package:best_architecture_challenge/infrastructure/post_dto.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class PostRemoteService {
  Future<List<PostDTO>> fetchPost() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    try {
      final response = await http.get(url);
      final dataList = jsonDecode(response.body) as List<dynamic>;
      final postDataList = dataList
          .map((post) => PostDTO.fromJson(post as Map<String, dynamic>))
          .toList();

      return postDataList;
    } catch (e) {
      //* return or throw error message here
      rethrow;
    }
  }
}
