import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header oranye
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: EdgeInsets.only(
              top: 60.h,
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad Ahop',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '+6289-1234-5678',
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // AKTIVITAS SAYA
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AKTIVITAS SAYA",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                MenuTile(icon: Icons.history, title: "Riwayat baca"),
                MenuTile(
                  icon: Icons.favorite_border,
                  title: "Berita yang disukai",
                ),
                MenuTile(icon: Icons.bookmark_border, title: "Bookmark"),
              ],
            ),
          ),

          SizedBox(height: 30.h),

          // LAINNYA
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LAINNYA", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),
                MenuTile(icon: Icons.help_outline, title: "Pusat Bantuan"),
                MenuTile(icon: Icons.info_outline, title: "Info"),
                MenuTile(icon: Icons.phone_android, title: "Tentang Aplikasi"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan setiap baris menu
class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        // Tambahkan aksi tap di sini jika diperlukan
      },
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
