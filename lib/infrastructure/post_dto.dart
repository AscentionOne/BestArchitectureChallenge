import 'package:best_architecture_challenge/domain/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_dto.freezed.dart';
part 'post_dto.g.dart';

@freezed
class PostDTO with _$PostDTO {
  const PostDTO._();
  const factory PostDTO({
    required int id,
    required String title,
    required String body,
  }) = _PostDTO;

  Post toDomain() => Post(
        id: id.toString(),
        title: title,
        body: body,
      );
  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);
}
