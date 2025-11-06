import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('학교지도'),
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
      body: Stack(
        children: [
          // 여기에 GoogleMap 위젯이 들어갑니다.
          Container(
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                '지도 영역',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),

          // 상단 검색창
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '목적지 입력',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: TextButton(
                        onPressed: (){},
                        child: const Text('완료', style: TextStyle(color: Colors.white)),
                      )
                  )
                ],
              ),
            ),
          ),

          // 하단 정보 카드
          Positioned(
            bottom: 24,
            left: 16,
            right: 16,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '도착지: 대학본관 > 행정지원처',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Icon(Icons.directions_walk, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('경기 안양시 만안구 2층', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('도보 5분', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          '14:25',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}