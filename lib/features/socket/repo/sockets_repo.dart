import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:websocket/features/socket/models/socket_data_ui.dart';

class SocketRepo {
  static Future<List<SocketDataModel>> fetchSocketData() async {
  final client = http.Client();
  final url = Uri.parse('https://api.binance.com/api/v3/depth?symbol=BNBBTC&limit=10');

  try {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final bidsList = jsonData['bids'] as List<dynamic>;

      final socketDataList = bidsList.map((item) {
        return SocketDataModel.fromJson({
          'lastUpdateId': jsonData['lastUpdateId'],
          'bids': [item],
        });
      }).toList();

      return socketDataList;
    } else {
      throw Exception('Failed to load data');
    }
  } finally {
    client.close();
  }
}
  }

