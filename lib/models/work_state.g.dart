// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkStateImpl _$$WorkStateImplFromJson(Map<String, dynamic> json) =>
    _$WorkStateImpl(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      image: json['image'] == null
          ? null
          : WorkImage.fromJson(json['image'] as Map<String, dynamic>),
      sourceUrl: json['sourceUrl'] as String,
      appUrl: json['appUrl'] as String,
      tag: (json['tag'] as List<dynamic>)
          .map((e) => $enumDecode(_$TagEnumMap, e))
          .toList(),
      genre: $enumDecode(_$GenreEnumMap, json['genre']),
      platform: $enumDecode(_$PlatformEnumMap, json['platform']),
      translateTitle: json['translateTitle'] as String?,
    );

Map<String, dynamic> _$$WorkStateImplToJson(_$WorkStateImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'image': instance.image,
      'sourceUrl': instance.sourceUrl,
      'appUrl': instance.appUrl,
      'tag': instance.tag.map((e) => _$TagEnumMap[e]!).toList(),
      'genre': _$GenreEnumMap[instance.genre]!,
      'platform': _$PlatformEnumMap[instance.platform]!,
      'translateTitle': instance.translateTitle,
    };

const _$TagEnumMap = {
  Tag.none: 'none',
  Tag.flutter: 'flutter',
  Tag.unity: 'unity',
  Tag.csharp: 'csharp',
  Tag.cpp: 'cpp',
  Tag.dart: 'dart',
  Tag.siv3d: 'siv3d',
  Tag.dxlib: 'dxlib',
  Tag.deno: 'deno',
  Tag.javascript: 'javascript',
  Tag.typescript: 'typescript',
  Tag.svelete: 'svelete',
};

const _$GenreEnumMap = {
  Genre.document: 'document',
  Genre.app: 'app',
  Genre.game: 'game',
};

const _$PlatformEnumMap = {
  Platform.web: 'web',
  Platform.android: 'android',
  Platform.windows: 'windows',
  Platform.vr: 'vr',
  Platform.physics: 'physics',
};

_$WorkImageImpl _$$WorkImageImplFromJson(Map<String, dynamic> json) =>
    _$WorkImageImpl(
      src: json['src'] as String,
    );

Map<String, dynamic> _$$WorkImageImplToJson(_$WorkImageImpl instance) =>
    <String, dynamic>{
      'src': instance.src,
    };
