import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF750550);
const kSecondaryColor = Color(0xFF980F5A);
const kPurpleSoftColor = Color(0xFF570530);
const kPurpleDarkColor = Color(0xFF4C0027);

const kTextColor = Color(0xFF757575);
const Color kHintTextColor = Color(0xFFB9B9B9);
const Color kBackgroundColor = Color(0xFFF0F0F0);

AppBar appBarGradient(String title) {
  return AppBar(
      elevation: 0,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      flexibleSpace: Container(
        decoration: gradientDecoration(),
      ));
}

BoxDecoration gradientDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[kPurpleDarkColor, kSecondaryColor]));
}

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Nunito",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
    scaffoldBackgroundColor: kBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    subtitle1: titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
    bodyText1: _selectedTabLight,
    bodyText2: _unSelectedTabLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    subtitle1: _titleDark,
    subtitle2: _subTitleDark,
    button: _buttonDark,
    bodyText1: _selectedTabDark,
    bodyText2: _unSelectedTabDark,
  );

  static final TextStyle titleLight = TextStyle(
    color: Colors.black,
    fontSize: 3.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 2 * SizeConfig.textMultiplier,
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 2.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _titleDark = titleLight.copyWith(color: Colors.white);

  static final TextStyle _subTitleDark =
      _subTitleLight.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark =
      _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchDark.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark =
      _selectedTabDark.copyWith(color: Colors.white);

  static final TextStyle _unSelectedTabDark =
      _selectedTabDark.copyWith(color: Colors.white70);
}
