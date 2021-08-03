// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDTO _$PostDTOFromJson(Map<String, dynamic> json) {
  return _PostDTO.fromJson(json);
}

/// @nodoc
class _$PostDTOTearOff {
  const _$PostDTOTearOff();

  _PostDTO call(
      {required int id, required String title, required String body}) {
    return _PostDTO(
      id: id,
      title: title,
      body: body,
    );
  }

  PostDTO fromJson(Map<String, Object> json) {
    return PostDTO.fromJson(json);
  }
}

/// @nodoc
const $PostDTO = _$PostDTOTearOff();

/// @nodoc
mixin _$PostDTO {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDTOCopyWith<PostDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDTOCopyWith<$Res> {
  factory $PostDTOCopyWith(PostDTO value, $Res Function(PostDTO) then) =
      _$PostDTOCopyWithImpl<$Res>;
  $Res call({int id, String title, String body});
}

/// @nodoc
class _$PostDTOCopyWithImpl<$Res> implements $PostDTOCopyWith<$Res> {
  _$PostDTOCopyWithImpl(this._value, this._then);

  final PostDTO _value;
  // ignore: unused_field
  final $Res Function(PostDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostDTOCopyWith<$Res> implements $PostDTOCopyWith<$Res> {
  factory _$PostDTOCopyWith(_PostDTO value, $Res Function(_PostDTO) then) =
      __$PostDTOCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title, String body});
}

/// @nodoc
class __$PostDTOCopyWithImpl<$Res> extends _$PostDTOCopyWithImpl<$Res>
    implements _$PostDTOCopyWith<$Res> {
  __$PostDTOCopyWithImpl(_PostDTO _value, $Res Function(_PostDTO) _then)
      : super(_value, (v) => _then(v as _PostDTO));

  @override
  _PostDTO get _value => super._value as _PostDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_PostDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDTO extends _PostDTO {
  const _$_PostDTO({required this.id, required this.title, required this.body})
      : super._();

  factory _$_PostDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_PostDTOFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'PostDTO(id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body);

  @JsonKey(ignore: true)
  @override
  _$PostDTOCopyWith<_PostDTO> get copyWith =>
      __$PostDTOCopyWithImpl<_PostDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostDTOToJson(this);
  }
}

abstract class _PostDTO extends PostDTO {
  const factory _PostDTO(
      {required int id,
      required String title,
      required String body}) = _$_PostDTO;
  const _PostDTO._() : super._();

  factory _PostDTO.fromJson(Map<String, dynamic> json) = _$_PostDTO.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostDTOCopyWith<_PostDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
