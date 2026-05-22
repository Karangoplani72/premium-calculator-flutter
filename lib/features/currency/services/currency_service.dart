import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrencyService {
  static Future<double> convertCurrency({
    required String from,

    required String to,

    required double amount,
  }) async {
    try {
      final url = Uri.parse("https://open.er-api.com/v6/latest/$from");

      final response = await http.get(url);

      final data = jsonDecode(response.body);

      final rate = data["rates"][to];

      return amount * rate;
    } catch (e) {
      return 0;
    }
  }
}
