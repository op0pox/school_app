// lib/survey_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  // URL을 실행하는 함수
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문 / 강의평가'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 여기에 해야 할 설문/강의평가 목록을 추가합니다.
          _buildSurveyItem(
            title: '2025-1학기 강의평가',
            subtitle: '마감: 2025. 10. 15.',
            onTap: () => _launchURL('https://portal.yiu.ac.kr'), // 실제 링크
          ),
          _buildSurveyItem(
            title: '도서관 이용 만족도 설문조사',
            subtitle: '마감: 2025. 10. 20.',
            onTap: () => _launchURL('https://portal.yiu.ac.kr'), // 실제 링크
          ),
          // 완료된 항목은 다르게 표시할 수도 있습니다.
          _buildSurveyItem(
            title: '신입생 대학생활 적응 설문',
            subtitle: '참여 완료',
            onTap: () {},
            isCompleted: true,
          ),
        ],
      ),
    );
  }

  // 설문 항목을 위한 커스텀 위젯
  Widget _buildSurveyItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isCompleted = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCompleted ? Colors.grey : Colors.black,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isCompleted ? Colors.grey : Colors.redAccent),
        ),
        trailing: isCompleted ? null : const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: isCompleted ? null : onTap,
      ),
    );
  }
}