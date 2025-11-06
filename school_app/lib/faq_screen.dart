// lib/faq_screen.dart

import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F&A'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // 여기에 F&A 목록을 추가하면 됩니다.
          FaqItem(
            question: '장학금 신청은 어떻게 하나요?',
            answer: '장학금 신청은 매 학기 초 학교 포털 시스템의 [장학/등록] 메뉴에서 신청할 수 있습니다. 자세한 일정은 학교 공지사항을 확인해주세요.',
          ),
          FaqItem(
            question: '셔틀버스 노선과 시간을 알고 싶어요.',
            answer: '셔틀버스 정보는 본 앱의 [셔틀버스] 메뉴 또는 학교 홈페이지의 [대학생활] > [셔틀버스 안내]에서 확인하실 수 있습니다.',
          ),
          FaqItem(
            question: '이클래스 아이디/비밀번호를 잊어버렸어요.',
            answer: '아이디/비밀번호 찾기는 학교 포털 로그인 페이지의 [아이디/비밀번호 찾기] 기능을 이용해주시기 바랍니다. 해결되지 않을 경우, 학생지원처로 문의해주세요.',
          ),
          FaqItem(
            question: '기숙사 신청은 언제부터 가능한가요?',
            answer: '기숙사 신청은 일반적으로 방학 중에 다음 학기 입사 신청을 받습니다. 정확한 일정은 기숙사 홈페이지 공지사항에 별도로 게시됩니다.',
          ),
        ],
      ),
    );
  }
}

// F&A 항목을 위한 커스텀 위젯
class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        childrenPadding: const EdgeInsets.all(16.0),
        children: [
          Text(
            answer,
            style: const TextStyle(height: 1.5), // 줄 간격 조절
          ),
        ],
      ),
    );
  }
}