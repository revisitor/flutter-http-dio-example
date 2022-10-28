import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class WebView extends StatelessWidget {
  final _url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final _logger = Logger();
  final _dio = Dio();

  WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _getViaHttp(),
                child: const Text("Get via http"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _getViaDio(),
                child: const Text('Get via dio'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getViaHttp() async {
    final response = await http.get(_url);
    if (response.statusCode == 200) {
      _logger.i(response.body);
    } else {
      throw Exception('Невозможно получить посты');
    }
  }

  Future<void> _getViaDio() async {
    final response = await _dio.getUri(_url);
    if (response.statusCode == 200) {
      _logger.i(response);
    } else {
      throw Exception('Невозможно получить посты');
    }
  }
}
