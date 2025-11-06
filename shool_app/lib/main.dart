import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '연성대학교 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //UI디자인에 맞는 기본 폰트 설정 가능
        fontFamily: 'Pretendard', //예시 폰트
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}