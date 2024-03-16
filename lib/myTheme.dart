import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xffDFECDB),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        bodyMedium:
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
      ));
}
