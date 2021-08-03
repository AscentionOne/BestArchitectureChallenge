import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_failure.freezed.dart';

@freezed
class PostFailure with _$PostFailure {
  const PostFailure._();
  const factory PostFailure.api(String? errorMessage) = _Api;
}
