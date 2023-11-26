import 'dart:convert';

import 'package:app/models/work_state.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_provider.g.dart';

@riverpod
Future<List<WorkState>> fetchWork(FetchWorkRef ref) async {
  const url = String.fromEnvironment('NEWT_URL');
  const token = String.fromEnvironment('NEWT_TOKEN');
  final data = await http.get(
    Uri.parse(url),
    headers: {"Authorization": 'Bearer $token'},
  );
  final json = jsonDecode(data.body);
  final workList = List.from(json['items'])
      .map((e) => WorkState.fromJson(e))
      .toList()
    ..sort((a, b) => a.date.compareTo(b.date));
  return workList.reversed.toList();
}
