import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:deriv_interview_test/model/price_tracker_model.dart';
import 'package:http/http.dart' as http;

class PriceTrackerRepository {
  Future<List<PriceTracker>> getActiveSymbols() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return PriceTracker(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return result;
    } else {
      throw "Something wrong code ${response.statusCode}";
    }
  }

  getTicksStream() {}

  forgetStream() {}

  Future<List<PriceTracker>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return PriceTracker(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return result;
    } else {
      throw "Something wrong code ${response.statusCode}";
    }
  }
}
