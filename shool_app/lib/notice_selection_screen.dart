// lib/notice_selection_screen.dart

import 'package:flutter/material.dart';
import 'notices_screen.dart';

class NoticeSelectionScreen extends StatelessWidget {
  const NoticeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // API 서버의 기본 주소
    const String baseUrl = 'http://127.0.0.1:5000'; // 크롬에서 테스트 시
    // const String baseUrl = 'http://10.0.2.2:5000'; // 에뮬레이터에서 테스트 시

    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항 선택'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('학사공지', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('학사일정, 휴보강 등 주요 공지를 확인하세요.'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NoticesScreen(
                  title: '학사공지',
                  apiUrl: '$baseUrl/academic-notice', // 사용자의 api.py에 맞춘 주소
                ),
              ));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('장학공지', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('장학금 신청 및 대출 관련 공지를 확인하세요.'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NoticesScreen(
                  title: '장학공지',
                  apiUrl: '$baseUrl/scholarship-notices', // 사용자의 api.py에 맞춘 주소
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}