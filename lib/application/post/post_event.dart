part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.postFetched() = _PostFetched;
  const factory PostEvent.postFilteredById() = _PostFilteredById;
  const factory PostEvent.postFilteredByTitle() = _PostFilteredByTitle;
}
