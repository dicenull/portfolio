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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkState _$WorkStateFromJson(Map<String, dynamic> json) {
  return _WorkState.fromJson(json);
}

/// @nodoc
mixin _$WorkState {
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  WorkImage? get image => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;
  String get appUrl => throw _privateConstructorUsedError;
  List<Tag> get tag => throw _privateConstructorUsedError;
  Genre get genre => throw _privateConstructorUsedError;
  Platform get platform => throw _privateConstructorUsedError;
  String? get translateTitle => throw _privateConstructorUsedError;

  /// Serializes this WorkState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkStateCopyWith<WorkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkStateCopyWith<$Res> {
  factory $WorkStateCopyWith(WorkState value, $Res Function(WorkState) then) =
      _$WorkStateCopyWithImpl<$Res, WorkState>;
  @useResult
  $Res call(
      {String title,
      DateTime date,
      String description,
      WorkImage? image,
      String sourceUrl,
      String appUrl,
      List<Tag> tag,
      Genre genre,
      Platform platform,
      String? translateTitle});

  $WorkImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$WorkStateCopyWithImpl<$Res, $Val extends WorkState>
    implements $WorkStateCopyWith<$Res> {
  _$WorkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? description = null,
    Object? image = freezed,
    Object? sourceUrl = null,
    Object? appUrl = null,
    Object? tag = null,
    Object? genre = null,
    Object? platform = null,
    Object? translateTitle = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as WorkImage?,
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
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
      translateTitle: freezed == translateTitle
          ? _value.translateTitle
          : translateTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $WorkImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkStateImplCopyWith<$Res>
    implements $WorkStateCopyWith<$Res> {
  factory _$$WorkStateImplCopyWith(
          _$WorkStateImpl value, $Res Function(_$WorkStateImpl) then) =
      __$$WorkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DateTime date,
      String description,
      WorkImage? image,
      String sourceUrl,
      String appUrl,
      List<Tag> tag,
      Genre genre,
      Platform platform,
      String? translateTitle});

  @override
  $WorkImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$WorkStateImplCopyWithImpl<$Res>
    extends _$WorkStateCopyWithImpl<$Res, _$WorkStateImpl>
    implements _$$WorkStateImplCopyWith<$Res> {
  __$$WorkStateImplCopyWithImpl(
      _$WorkStateImpl _value, $Res Function(_$WorkStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? description = null,
    Object? image = freezed,
    Object? sourceUrl = null,
    Object? appUrl = null,
    Object? tag = null,
    Object? genre = null,
    Object? platform = null,
    Object? translateTitle = freezed,
  }) {
    return _then(_$WorkStateImpl(
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as WorkImage?,
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
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Genre,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
      translateTitle: freezed == translateTitle
          ? _value.translateTitle
          : translateTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkStateImpl extends _WorkState {
  _$WorkStateImpl(
      {required this.title,
      required this.date,
      required this.description,
      required this.image,
      required this.sourceUrl,
      required this.appUrl,
      required final List<Tag> tag,
      required this.genre,
      required this.platform,
      this.translateTitle})
      : _tag = tag,
        super._();

  factory _$WorkStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkStateImplFromJson(json);

  @override
  final String title;
  @override
  final DateTime date;
  @override
  final String description;
  @override
  final WorkImage? image;
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
  final Genre genre;
  @override
  final Platform platform;
  @override
  final String? translateTitle;

  @override
  String toString() {
    return 'WorkState(title: $title, date: $date, description: $description, image: $image, sourceUrl: $sourceUrl, appUrl: $appUrl, tag: $tag, genre: $genre, platform: $platform, translateTitle: $translateTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.appUrl, appUrl) || other.appUrl == appUrl) &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.translateTitle, translateTitle) ||
                other.translateTitle == translateTitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      date,
      description,
      image,
      sourceUrl,
      appUrl,
      const DeepCollectionEquality().hash(_tag),
      genre,
      platform,
      translateTitle);

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkStateImplCopyWith<_$WorkStateImpl> get copyWith =>
      __$$WorkStateImplCopyWithImpl<_$WorkStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkStateImplToJson(
      this,
    );
  }
}

abstract class _WorkState extends WorkState {
  factory _WorkState(
      {required final String title,
      required final DateTime date,
      required final String description,
      required final WorkImage? image,
      required final String sourceUrl,
      required final String appUrl,
      required final List<Tag> tag,
      required final Genre genre,
      required final Platform platform,
      final String? translateTitle}) = _$WorkStateImpl;
  _WorkState._() : super._();

  factory _WorkState.fromJson(Map<String, dynamic> json) =
      _$WorkStateImpl.fromJson;

  @override
  String get title;
  @override
  DateTime get date;
  @override
  String get description;
  @override
  WorkImage? get image;
  @override
  String get sourceUrl;
  @override
  String get appUrl;
  @override
  List<Tag> get tag;
  @override
  Genre get genre;
  @override
  Platform get platform;
  @override
  String? get translateTitle;

  /// Create a copy of WorkState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkStateImplCopyWith<_$WorkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkImage _$WorkImageFromJson(Map<String, dynamic> json) {
  return _WorkImage.fromJson(json);
}

/// @nodoc
mixin _$WorkImage {
  String get src => throw _privateConstructorUsedError;

  /// Serializes this WorkImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of WorkImage
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$WorkImageImplCopyWith<$Res>
    implements $WorkImageCopyWith<$Res> {
  factory _$$WorkImageImplCopyWith(
          _$WorkImageImpl value, $Res Function(_$WorkImageImpl) then) =
      __$$WorkImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$WorkImageImplCopyWithImpl<$Res>
    extends _$WorkImageCopyWithImpl<$Res, _$WorkImageImpl>
    implements _$$WorkImageImplCopyWith<$Res> {
  __$$WorkImageImplCopyWithImpl(
      _$WorkImageImpl _value, $Res Function(_$WorkImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$WorkImageImpl(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkImageImpl extends _WorkImage {
  _$WorkImageImpl({required this.src}) : super._();

  factory _$WorkImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkImageImplFromJson(json);

  @override
  final String src;

  @override
  String toString() {
    return 'WorkImage(src: $src)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkImageImpl &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  /// Create a copy of WorkImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkImageImplCopyWith<_$WorkImageImpl> get copyWith =>
      __$$WorkImageImplCopyWithImpl<_$WorkImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkImageImplToJson(
      this,
    );
  }
}

abstract class _WorkImage extends WorkImage {
  factory _WorkImage({required final String src}) = _$WorkImageImpl;
  _WorkImage._() : super._();

  factory _WorkImage.fromJson(Map<String, dynamic> json) =
      _$WorkImageImpl.fromJson;

  @override
  String get src;

  /// Create a copy of WorkImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkImageImplCopyWith<_$WorkImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
