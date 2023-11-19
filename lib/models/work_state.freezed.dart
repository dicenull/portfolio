// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkState _$WorkStateFromJson(Map<String, dynamic> json) {
  return _WorkState.fromJson(json);
}

/// @nodoc
mixin _$WorkState {
  @JsonKey(name: 'title-875803')
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  WorkImage get image => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;
  String get appUrl => throw _privateConstructorUsedError;
  List<Tag> get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkStateCopyWith<WorkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkStateCopyWith<$Res> {
  factory $WorkStateCopyWith(WorkState value, $Res Function(WorkState) then) =
      _$WorkStateCopyWithImpl<$Res, WorkState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title-875803') String title,
      DateTime date,
      String description,
      WorkImage image,
      String sourceUrl,
      String appUrl,
      List<Tag> tag});

  $WorkImageCopyWith<$Res> get image;
}

/// @nodoc
class _$WorkStateCopyWithImpl<$Res, $Val extends WorkState>
    implements $WorkStateCopyWith<$Res> {
  _$WorkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? description = null,
    Object? image = null,
    Object? sourceUrl = null,
    Object? appUrl = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as WorkImage,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      appUrl: null == appUrl
          ? _value.appUrl
          : appUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkImageCopyWith<$Res> get image {
    return $WorkImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkStateCopyWith<$Res> implements $WorkStateCopyWith<$Res> {
  factory _$$_WorkStateCopyWith(
          _$_WorkState value, $Res Function(_$_WorkState) then) =
      __$$_WorkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title-875803') String title,
      DateTime date,
      String description,
      WorkImage image,
      String sourceUrl,
      String appUrl,
      List<Tag> tag});

  @override
  $WorkImageCopyWith<$Res> get image;
}

/// @nodoc
class __$$_WorkStateCopyWithImpl<$Res>
    extends _$WorkStateCopyWithImpl<$Res, _$_WorkState>
    implements _$$_WorkStateCopyWith<$Res> {
  __$$_WorkStateCopyWithImpl(
      _$_WorkState _value, $Res Function(_$_WorkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? description = null,
    Object? image = null,
    Object? sourceUrl = null,
    Object? appUrl = null,
    Object? tag = null,
  }) {
    return _then(_$_WorkState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as WorkImage,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      appUrl: null == appUrl
          ? _value.appUrl
          : appUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkState extends _WorkState {
  _$_WorkState(
      {@JsonKey(name: 'title-875803') required this.title,
      required this.date,
      required this.description,
      required this.image,
      required this.sourceUrl,
      required this.appUrl,
      required final List<Tag> tag})
      : _tag = tag,
        super._();

  factory _$_WorkState.fromJson(Map<String, dynamic> json) =>
      _$$_WorkStateFromJson(json);

  @override
  @JsonKey(name: 'title-875803')
  final String title;
  @override
  final DateTime date;
  @override
  final String description;
  @override
  final WorkImage image;
  @override
  final String sourceUrl;
  @override
  final String appUrl;
  final List<Tag> _tag;
  @override
  List<Tag> get tag {
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tag);
  }

  @override
  String toString() {
    return 'WorkState(title: $title, date: $date, description: $description, image: $image, sourceUrl: $sourceUrl, appUrl: $appUrl, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.appUrl, appUrl) || other.appUrl == appUrl) &&
            const DeepCollectionEquality().equals(other._tag, _tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, date, description, image,
      sourceUrl, appUrl, const DeepCollectionEquality().hash(_tag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkStateCopyWith<_$_WorkState> get copyWith =>
      __$$_WorkStateCopyWithImpl<_$_WorkState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkStateToJson(
      this,
    );
  }
}

abstract class _WorkState extends WorkState {
  factory _WorkState(
      {@JsonKey(name: 'title-875803') required final String title,
      required final DateTime date,
      required final String description,
      required final WorkImage image,
      required final String sourceUrl,
      required final String appUrl,
      required final List<Tag> tag}) = _$_WorkState;
  _WorkState._() : super._();

  factory _WorkState.fromJson(Map<String, dynamic> json) =
      _$_WorkState.fromJson;

  @override
  @JsonKey(name: 'title-875803')
  String get title;
  @override
  DateTime get date;
  @override
  String get description;
  @override
  WorkImage get image;
  @override
  String get sourceUrl;
  @override
  String get appUrl;
  @override
  List<Tag> get tag;
  @override
  @JsonKey(ignore: true)
  _$$_WorkStateCopyWith<_$_WorkState> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkImage _$WorkImageFromJson(Map<String, dynamic> json) {
  return _WorkImage.fromJson(json);
}

/// @nodoc
mixin _$WorkImage {
  String get src => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkImageCopyWith<WorkImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkImageCopyWith<$Res> {
  factory $WorkImageCopyWith(WorkImage value, $Res Function(WorkImage) then) =
      _$WorkImageCopyWithImpl<$Res, WorkImage>;
  @useResult
  $Res call({String src});
}

/// @nodoc
class _$WorkImageCopyWithImpl<$Res, $Val extends WorkImage>
    implements $WorkImageCopyWith<$Res> {
  _$WorkImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_value.copyWith(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkImageCopyWith<$Res> implements $WorkImageCopyWith<$Res> {
  factory _$$_WorkImageCopyWith(
          _$_WorkImage value, $Res Function(_$_WorkImage) then) =
      __$$_WorkImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$_WorkImageCopyWithImpl<$Res>
    extends _$WorkImageCopyWithImpl<$Res, _$_WorkImage>
    implements _$$_WorkImageCopyWith<$Res> {
  __$$_WorkImageCopyWithImpl(
      _$_WorkImage _value, $Res Function(_$_WorkImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$_WorkImage(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkImage extends _WorkImage {
  _$_WorkImage({required this.src}) : super._();

  factory _$_WorkImage.fromJson(Map<String, dynamic> json) =>
      _$$_WorkImageFromJson(json);

  @override
  final String src;

  @override
  String toString() {
    return 'WorkImage(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkImage &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkImageCopyWith<_$_WorkImage> get copyWith =>
      __$$_WorkImageCopyWithImpl<_$_WorkImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkImageToJson(
      this,
    );
  }
}

abstract class _WorkImage extends WorkImage {
  factory _WorkImage({required final String src}) = _$_WorkImage;
  _WorkImage._() : super._();

  factory _WorkImage.fromJson(Map<String, dynamic> json) =
      _$_WorkImage.fromJson;

  @override
  String get src;
  @override
  @JsonKey(ignore: true)
  _$$_WorkImageCopyWith<_$_WorkImage> get copyWith =>
      throw _privateConstructorUsedError;
}
