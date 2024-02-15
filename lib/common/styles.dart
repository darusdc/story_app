import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff69e8fb);
const Color secondaryColor = Color(0xff06899c);

final TextTheme textTheme = TextTheme(
  titleLarge: GoogleFonts.montserrat(
      fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -1.5),
  titleMedium: GoogleFonts.montserrat(
      fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -0.5),
  titleSmall: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700),
  headlineLarge: GoogleFonts.firaSans(
      fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineMedium:
      GoogleFonts.firaSans(fontSize: 23, fontWeight: FontWeight.w400),
  headlineSmall: GoogleFonts.firaSans(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  displayLarge: GoogleFonts.palanquin(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  displayMedium: GoogleFonts.palanquin(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  displaySmall: GoogleFonts.palanquin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyLarge: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  bodySmall: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
);
ButtonStyle circleButton = const ButtonStyle(
    padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(20)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)))));
ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: secondaryColor,
      ),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textTheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
  useMaterial3: true,
);

const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Color(0xff64ffda);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: Colors.black,
        secondary: darkSecondaryColor,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textTheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
);
