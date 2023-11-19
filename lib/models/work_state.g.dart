// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkState _$$_WorkStateFromJson(Map<String, dynamic> json) => _$_WorkState(
      title: json['title-875803'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      image: WorkImage.fromJson(json['image'] as Map<String, dynamic>),
      sourceUrl: json['sourceUrl'] as String,
      appUrl: json['appUrl'] as String,
      tag: (json['tag'] as List<dynamic>)
          .map((e) => $enumDecode(_$TagEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_WorkStateToJson(_$_WorkState instance) =>
    <String, dynamic>{
      'title-875803': instance.title,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'image': instance.image,
      'sourceUrl': instance.sourceUrl,
      'appUrl': instance.appUrl,
      'tag': instance.tag.map((e) => _$TagEnumMap[e]!).toList(),
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
};

_$_WorkImage _$$_WorkImageFromJson(Map<String, dynamic> json) => _$_WorkImage(
      src: json['src'] as String,
    );

Map<String, dynamic> _$$_WorkImageToJson(_$_WorkImage instance) =>
    <String, dynamic>{
      'src': instance.src,
    };
