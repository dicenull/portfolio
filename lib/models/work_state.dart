import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_state.freezed.dart';
part 'work_state.g.dart';

@freezed
abstract class WorkState with _$WorkState {
  const WorkState._();

  factory WorkState({
    required String title,
    required DateTime date,
    required String description,
    required String? image,
    required String sourceUrl,
    required String appUrl,
    required List<Tag> tag,
    required Genre genre,
    required Platform platform,
    String? translateTitle,
  }) = _WorkState;

  factory WorkState.fromJson(Map<String, dynamic> json) =>
      _$WorkStateFromJson(json);

  String get compressText => "$title $description ${translateTitle ?? ''}";
}

enum Tag {
  none,
  flutter,
  unity,
  csharp,
  cpp,
  dart,
  siv3d,
  dxlib,
  deno,
  javascript,
  typescript,
  svelete,
}

enum Genre {
  document,
  app,
  game;

  (IconData icon, String label) toData() => switch (this) {
        Genre.document => (Icons.article, '記事'),
        Genre.app => (Icons.rocket_launch, 'アプリ'),
        Genre.game => (Icons.gamepad, 'ゲーム'),
      };
}

enum Platform {
  web,
  android,
  windows,
  vr,
  physics,
}
