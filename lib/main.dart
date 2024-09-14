import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:onlinecourse_ui/pages/landing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.comicNeueTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LandingPage(),
    );
  }
}
