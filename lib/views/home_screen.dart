import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int currentCarouselIndex = 0;

  final List<Map<String, dynamic>> newsItems = [
    {
      'type': 'carousel',
      'items': [
        {
          'image': 'assets/images/bulutangkis.jpg',
          'title': '15% OFF All Items',
        },
        {'image': 'assets/images/persib.jpg', 'title': 'Flash Sale is Live!'},
      ],
    },
    {
      'type': 'news',
      'image': 'assets/images/bulutangkis.jpg',
      'title': 'Apri/Febri Lolos ke Semifinal Malaysia Masters',
    },
    {
      'type': 'news',
      'image': 'assets/images/sepakbola.jpg',
      'title': 'Pengamat China: Kandang Timnas Indonesia Menyeramkan',
    },
    {
      'type': 'news',
      'image': 'assets/images/persib.jpg',
      'title': 'Persib Kembali ditinggal Sosok Kunci, Kali Ini Pelatih Kiper',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Image.network('assets/images/sport.png', width: 12.w),
        ),
        title: Text(
          'SportSync',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            SizedBox(height: 12.h),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search items',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Section Title
            Row(
              children: [
                Text(
                  'BERITA TRENDING',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.local_fire_department, color: Colors.orange),
              ],
            ),
            SizedBox(height: 12.h),

            // Combined News + Carousel
            Expanded(
              child: ListView.builder(
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  final item = newsItems[index];

                  if (item['type'] == 'carousel') {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 100.h,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentCarouselIndex = index;
                            });
                          },
                        ),
                        items:
                            (item['items'] as List).map<Widget>((carouselItem) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      carouselItem['image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    Positioned(
                                      left: 10,
                                      bottom: 10,
                                      child: Text(
                                        carouselItem['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    );
                  } else if (item['type'] == 'news') {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r),
                              ),
                              child: Image.asset(
                                item['image'],
                                width: double.infinity,
                                height: 180.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Text(
                                item['title'],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
