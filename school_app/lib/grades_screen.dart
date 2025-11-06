import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('성적 조회'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSemesterHeader(context),
          const SizedBox(height: 16),
          _buildSemesterGrades(
            semester: '2024년 2학기',
            gpa: '4.25 / 4.5',
            isActive: true,
          ),
          _buildGradeCard('리눅스', '3', 'A+'),
          _buildGradeCard('리눅스', '3', 'A+'),
          _buildGradeCard('리눅스', '3', 'A+'),
        ],
      ),
    );
  }

  // 학기 선택 헤더
  Widget _buildSemesterHeader(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('2025년 1학기', style: TextStyle(fontSize: 16)),
            TextButton(
              onPressed: () {},
              child: const Text('성적조회', style: TextStyle(fontSize: 16)),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF005EB8),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        ));
  }

  // 학기별 성적 정보
  Widget _buildSemesterGrades({required String semester, required String gpa, bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(semester, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              if (isActive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('O', style: TextStyle(color: Colors.white, fontSize: 10)),
                )
            ],
          ),
          const SizedBox(height: 4),
          Text('학점 $gpa', style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  // 과목별 성적 카드
  Widget _buildGradeCard(String course, String credits, String grade) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('교과', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(course, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(grade, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700])),
              ],
            ),
            const SizedBox(height: 4),
            Text('학점: $credits', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}