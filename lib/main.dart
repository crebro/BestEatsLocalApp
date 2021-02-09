import 'package:BestEatsLocal/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
