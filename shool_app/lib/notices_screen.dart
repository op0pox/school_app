// lib/notices_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NoticesScreen extends StatefulWidget {
  final String title;
  final String apiUrl;

  const NoticesScreen({
    super.key,
    required this.title,
    required this.apiUrl,
  });

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  Future<List<dynamic>>? noticesFuture;

  @override
  void initState() {
    super.initState();
    noticesFuture = fetchNotices();
  }

  Future<List<dynamic>> fetchNotices() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl));
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('서버 응답 오류');
      }
    } catch (e) {
      throw Exception('API 서버 연결 실패');
    }
  }

  // 링크를 여는 함수
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('링크를 열 수 없습니다: $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: noticesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final notices = snapshot.data!;
            return ListView.separated(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final notice = notices[index];
                return ListTile(
                  title: Text(notice['title'] ?? '제목 없음'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {
                    if (notice['link'] != null && notice['link'] != '링크 없음') {
                      _launchURL(notice['link']);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('연결된 링크가 없습니다.')),
                      );
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
            );
          } else {
            return const Center(child: Text('공지사항이 없습니다.'));
          }
        },
      ),
    );
  }
}