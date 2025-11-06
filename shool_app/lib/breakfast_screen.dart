// lib/breakfast_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BreakfastScreen extends StatefulWidget {
  const BreakfastScreen({super.key});

  @override
  State<BreakfastScreen> createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  Future<List<String>>? breakfastFuture;

  @override
  void initState() {
    super.initState();
    breakfastFuture = fetchBreakfastMenu();
  }

  Future<List<String>> fetchBreakfastMenu() async {
    const String apiUrl = 'http://127.0.0.1:5000/breakfast'; // 크롬에서 테스트 시
    // const String apiUrl = 'http://10.0.2.2:5000/breakfast'; // 에뮬레이터에서 테스트 시

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        return List<String>.from(data['menu']);
      } else {
        throw Exception('서버 응답 오류');
      }
    } catch (e) {
      throw Exception('API 서버 연결 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('천원의 아침밥')),
      body: FutureBuilder<List<String>>(
        future: breakfastFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final menu = snapshot.data!;
            return Card(
              margin: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                    title: Text(menu[index], style: const TextStyle(fontSize: 16)),
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 1),
              ),
            );
          } else {
            return const Center(child: Text('데이터 없음'));
          }
        },
      ),
    );
  }
}