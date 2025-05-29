import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final List<Map<String, String>> newsList = [
    {
      "title": "Apri/Febri lolos Semifinal Malaysia Masters 2025",
      "date": "September 4, 2023",
      "image": "assets/images/bulutangkis.jpg",
    },
    {
      "title": "Pengamat China: Kandang Timnas Indonesia Menyeramkan",
      "date": "August 15, 2023",
      "image": "assets/images/sepakbola.jpg",
    },
    {
      "title": "Persib Kembali ditinggal Sosok Kunci, Kali Ini Pelatih Kiper",
      "date": "August 10, 2023",
      "image": "assets/images/persib.jpg",
    },
    {
      "title": "Choosing the Right Running Shoes: A Step-by-Step Guide",
      "date": "July 25, 2023",
      "image": "assets/images/jojo.jpeg",
    },
    {
      "title": "Manchester United di bikin malu sama asean all-starts",
      "date": "June 18, 2023",
      "image": "assets/images/mu.jpg",
    },
    {
      "title": "Kisah Kakang Rudianto yang Bangga Kalahkan Manchester United ",
      "date": "Mei 28, 2025",
      "image": "assets/images/kang.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'BERITA TERKINI',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined, color: Colors.orange),
          ),
        ],
      ),
      body: ListView.builder(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    news['image']!,
                    width: 100.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news['date']!,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        news['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
