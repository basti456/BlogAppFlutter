import 'package:blog_app/core/constants/blog_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogThemes {
  BlogThemes._();
  static final light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: BlogColors.primaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static final dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: BlogColors.secondaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
