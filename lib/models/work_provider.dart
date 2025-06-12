import 'dart:convert';

import 'package:app/models/translator_provider.dart';
import 'package:app/models/work_state.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_provider.g.dart';

@riverpod
Future<List<WorkState>> fetchWork(FetchWorkRef ref) async {
  // ローカルassetsのdata.jsonを読み込む
  final data = await rootBundle.loadString('assets/data.json');
  final json = jsonDecode(data);
  final workList = List.from(json).map((e) => WorkState.fromJson(e)).toList()
    ..sort((a, b) => a.date.compareTo(b.date));

  final translates = await Future.wait(workList.map((e) async {
    final translation = await ref.read(translatorProvider).translate(e.title);

    return e.copyWith(translateTitle: translation.text);
  }));

  return translates.reversed.toList();
}
