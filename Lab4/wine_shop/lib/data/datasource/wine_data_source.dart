import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/models/wine_data.dart';

class WineDataSource {
  Future<WineData> loadWineData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    return WineData.fromJson(data);
  }
}
