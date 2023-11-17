import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_state.freezed.dart';
part 'work_state.g.dart';

@freezed
abstract class WorkState with _$WorkState {
  const WorkState._();

  factory WorkState({
    @JsonKey(name: 'title-875803') required String title,
    DateTime? date,
    String? description,
    WorkImage? image,
    String? sourceUrl,
    String? appUrl,
    List<Tag>? tag,
  }) = _WorkState;

  factory WorkState.fromJson(Map<String, dynamic> json) =>
      _$WorkStateFromJson(json);
}

@freezed
abstract class WorkImage with _$WorkImage {
  const WorkImage._();

  factory WorkImage({
    required String src,
  }) = _WorkImage;

  factory WorkImage.fromJson(Map<String, dynamic> json) =>
      _$WorkImageFromJson(json);
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
}
