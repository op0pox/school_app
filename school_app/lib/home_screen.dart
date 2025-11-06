// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'grades_screen.dart';
import 'professors_screen.dart';
import 'map_screen.dart';
import 'faq_screen.dart';
import 'survey_screen.dart';
import 'cafeteria_screen.dart';
import 'notice_selection_screen.dart'; // <-- notices_screen.dart 대신 이 파일을 임포트

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool hasNewSurvey = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('연성대학교'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 환영 메시지
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('OOO님,', style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                          Text('환영합니다!', style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Icon(Icons.star_border, color: Colors.yellow[700], size: 30)
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 메뉴 버튼 그리드
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.5,
                children: [
                  _buildMenuButton(context, '성적조회', Icons.assessment, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GradesScreen()));
                  }),
                  _buildMenuButton(context, '설문/평가', Icons.edit_note, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SurveyScreen()));
                  },
                    showNotification: hasNewSurvey,
                  ),
                  _buildMenuButton(context, '시간표조회', Icons.schedule, () {}),
                  _buildMenuButton(context, '교수님 연락처', Icons.contact_phone, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfessorsScreen()));
                  }),
                  _buildMenuButton(context, '셔틀버스', Icons.directions_bus, () {}),
                  _buildMenuButton(context, '학교지도', Icons.map, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MapScreen()));
                  }),
                  _buildMenuButton(context, '학식메뉴', Icons.restaurant_menu, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CafeteriaScreen()));
                  }),

                  // --- 수정된 부분: 공지사항 버튼이 선택 화면으로 이동 ---
                  _buildMenuButton(context, '공지사항', Icons.campaign, () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const NoticeSelectionScreen(),
                    ));
                  }),
                ],
              ),
              const SizedBox(height: 20),

              // 홈페이지 바로가기 버튼
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: const Text('홈페이지 바로가기',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 버튼 위젯
  Widget _buildMenuButton(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onPressed, {
        bool showNotification = false,
      }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 2,
              shadowColor: Colors.grey.withOpacity(0.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: const Color(0xFF005EB8)),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        if (showNotification)
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}