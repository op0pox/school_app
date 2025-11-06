// lib/food_court_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodCourtScreen extends StatefulWidget {
  const FoodCourtScreen({super.key});

  @override
  State<FoodCourtScreen> createState() => _FoodCourtScreenState();
}

class _FoodCourtScreenState extends State<FoodCourtScreen> {
  Future<List<dynamic>>? foodCourtFuture;

  @override
  void initState() {
    super.initState();
    foodCourtFuture = fetchFoodCourtMenu();
  }

  Future<List<dynamic>> fetchFoodCourtMenu() async {
    const String apiUrl = 'http://127.0.0.1:5000/foodcourt'; // 크롬에서 테스트 시
    // const String apiUrl = 'http://10.0.2.2:5000/foodcourt'; // 에뮬레이터에서 테스트 시

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
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
      appBar: AppBar(title: const Text('푸드코트 메뉴')),
      body: FutureBuilder<List<dynamic>>(
        future: foodCourtFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final corners = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: corners.length,
              itemBuilder: (context, index) {
                final corner = corners[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ExpansionTile(
                    title: Text(corner['corner'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    children: (corner['daily_menus'] as Map<String, dynamic>).entries.map((entry) {
                      final day = entry.key;
                      final menus = (entry.value as List).join(', ');
                      return ListTile(
                        dense: true,
                        title: Text(day, style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text(menus.isNotEmpty ? menus : '메뉴 정보 없음'),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('데이터 없음'));
          }
        },
      ),
    );
  }
}