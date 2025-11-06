// lib/menu_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<List<String>>? menuFuture;

  @override
  void initState() {
    super.initState();
    menuFuture = fetchMenu();
  }

  Future<List<String>> fetchMenu() async {
    // 매우 중요: 안드로이드 에뮬레이터에서 PC의 서버(localhost)에 접속할 때는
    // 127.0.0.1 대신 10.0.2.2를 사용해야 함.
    //const String apiUrl = 'http://10.0.2.2:5000/menu';  //애뮬레이터 용
    const String apiUrl = 'http://127.0.0.1:5000/menu';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // 성공적으로 데이터를 받아왔을 때
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final List<String> menuList = List<String>.from(data['menu']);
        return menuList;
      } else {
        // 서버에서 오류 응답을 보냈을 때
        throw Exception('서버로부터 데이터를 불러오기 실패.');
      }
    } catch (e) {
      // 인터넷 연결 문제 등 요청 자체에 실패했을 때
      throw Exception('API 서버에 연결할 수 없음. 서버 켜져 있는지 확인.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 학식 메뉴'),
      ),
      body: FutureBuilder<List<String>>(
        future: menuFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터 로딩 중일 때
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // 오류가 발생했을 때
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('오류: ${snapshot.error}'),
              ),
            );
          } else if (snapshot.hasData) {
            // 성공적으로 데이터를 받았을 때
            final menu = snapshot.data!;
            if (menu.isEmpty) {
              return const Center(child: Text('오늘의 메뉴 정보가 없습니다.'));
            }
            // 카드 UI 사용
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
            return const Center(child: Text('데이터를 불러오는 중...'));
          }
        },
      ),
    );
  }
}