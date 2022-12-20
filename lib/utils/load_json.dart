import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadJson(String path) async {
  final data = await rootBundle.loadString(path);

  return jsonDecode(data) as Map<String, dynamic>;
}
