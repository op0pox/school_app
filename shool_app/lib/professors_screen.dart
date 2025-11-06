import 'package:flutter/material.dart';

class ProfessorsScreen extends StatelessWidget {
  const ProfessorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('교수님 연락처'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 검색창
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // 교수님 목록
            Expanded(
              child: ListView.separated(
                itemCount: 4, // 예시 데이터 개수
                itemBuilder: (context, index) {
                  return _buildProfessorTile(
                    name: '홍길동',
                    phoneNumber: '010-1234-1234',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 교수님 연락처 타일
  Widget _buildProfessorTile({required String name, required String phoneNumber}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            // backgroundImage: AssetImage('assets/profile_image.png'), // 프로필 이미지
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('교수: $name', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('번호: $phoneNumber', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.message, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}