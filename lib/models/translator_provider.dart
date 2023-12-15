import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:translator_plus/translator_plus.dart';

final translatorProvider = Provider((ref) => GoogleTranslator());
