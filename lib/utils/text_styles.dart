import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovation/theme/app_color.dart';

TextStyle get titleStyle {
  return GoogleFonts.syne(
      textStyle: const TextStyle(fontSize: 12, color: AppColor.swatch));
}

TextStyle get buttonStyle {
  return GoogleFonts.syne(
      textStyle: const TextStyle(fontSize: 12, color: AppColor.white));
}

TextStyle get mainTitle {
  return const TextStyle(
      fontSize: 28, color: AppColor.swatch, fontWeight: FontWeight.bold);
}

TextStyle get mainHead {
  return const TextStyle(fontSize: 22, color: AppColor.swatch);
}

TextStyle get mainHeadSmall {
  return GoogleFonts.syne(
      textStyle: const TextStyle(fontSize: 18, color: AppColor.swatch));
}

TextStyle get mainBody {
  return const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.swatch);
}

TextStyle get mainHint {
  return const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w300, color: AppColor.swatch);
}

TextStyle get subHead {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: AppColor.swatch));
}

TextStyle get subBody {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(fontSize: 14, color: AppColor.swatch));
}

TextStyle get subHint {
  return GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300, color: AppColor.swatch));
}
