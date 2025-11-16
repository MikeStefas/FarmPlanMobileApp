import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> postFarmPlanResult(
  Map<String, dynamic> input,
) async {
  try {
    final url = Uri.parse("http://127.0.0.1:5000/FarmPlanResult");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'ngrok-skip-browser-warning': 'true',
      },
      body: jsonEncode(input),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Server error: ${response.statusCode}");
      print("Response body: ${response.body}");
      return null;
    }
  } catch (e) {
    print("Error posting data: $e");
    return null;
  }
}
