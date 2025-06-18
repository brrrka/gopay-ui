import 'package:flutter/material.dart';
import 'package:gopay_ui/dashboard.dart';
import 'package:gopay_ui/home.dart';
import 'package:gopay_ui/profile.dart';
import 'package:gopay_ui/promo.dart';
import 'package:gopay_ui/qris.dart';
import 'package:gopay_ui/riwayat.dart';
import 'package:gopay_ui/topup.dart';
import 'package:gopay_ui/bantuan.dart';
import 'package:gopay_ui/pesan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF00880C),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Dashboard(),
        '/home': (context) => const Home(),
        '/topup': (context) => const TopUp(),
        '/profile': (context) => const Profile(),
        '/promo': (context) => const Promo(),
        '/qris': (context) => const Qris(),
        '/riwayat': (context) => const Riwayat(),
        '/pesan': (context) => const Pesan(),
        '/bantuan': (context) => const Bantuan(),
      },
    );
  }
}
