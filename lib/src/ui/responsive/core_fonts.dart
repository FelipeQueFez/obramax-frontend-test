import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core_colors.dart';

abstract class CoreFonts {
  static final ubunturegular16 = GoogleFonts.ubuntu(
    color: FactoryColors.color1,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static final ubuntubold16 = GoogleFonts.ubuntu(
    color: FactoryColors.color1,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
