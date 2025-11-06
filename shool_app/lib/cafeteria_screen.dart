// lib/cafeteria_screen.dart

import 'package:flutter/material.dart';
import 'food_court_screen.dart';
import 'breakfast_screen.dart';

class CafeteriaScreen extends StatelessWidget {
  const CafeteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('식단 안내'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuButton(
              context,
              '푸드코트',
              '코너별 식단을 확인하세요',
              Icons.restaurant,
                  () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FoodCourtScreen()));
              },
            ),
            const SizedBox(height: 20),
            _buildMenuButton(
              context,
              '천원의 아침밥',
              '든든한 아침 식사를 즐겨보세요',
              Icons.rice_bowl,
                  () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BreakfastScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}