import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // ====== HEADINGS ======
  static final heading1 = GoogleFonts.notoSerif(
    fontSize: 45,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static final heading2 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
    color: Colors.black,
  );

  static final heading3 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600, // Medium
    color: Colors.black,
  );

  // ====== BODY / CONTENT ======
  static final regularBody = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
  );


  static final regularGreyBody = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey// Regular
  );

  static final smallGreyBody = GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.grey// Regular
  );

  static final mediumBody = GoogleFonts.notoSerif(
    fontSize: 16,
    fontWeight: FontWeight.w500, // Medium
    color: Colors.black87,
    height: 1.5,
  );

  static final smallText = GoogleFonts.notoSerif(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey.shade700,
  );

  static final regularSansBody = GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black// Regular
  );
  static final regularGreySansBody = GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey// Regular
  );
  // ====== HIGHLIGHT / ACCENT TEXT ======
  static final highlight = GoogleFonts.notoSerif(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.blueAccent,
  );
}
