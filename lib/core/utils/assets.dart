import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/generated/l10n.dart';

class AssetsData {
  static const splash = 'assets/images/img_splash.png';
  static const logoForPhoto = 'assets/images/logo_for_photo.png';
  static const profile = 'assets/images/profile.png';
  static const room = "assets/images/home_3.jpeg";
}

// all strings in app
class AppString {
  static String titleAppBarSettings = S().sittings;
  static String generalText = S().general;
  static const String fontfamilyMonserrat = "Montserrat";
  static const String fontfamilyPoppins = "Poppins";
  static const String fontfamilyInter = "Inter";
  static String theme = S().theme;
  static String language = S().language;
  static String eng = S().english;
  static String notifications = S().notifications;
  static String account = S().account;
  static String profile = S().profile;
  static String other = S().other;
  static String privacyPolicy = S().privacypolicy;
  static String aboutUs = S().aboutus;
  static String favorite = S().favorite;
  static String category = S().category;
  static const String bedroom = "Bedroom";
  static const String livingRoom = "Living room";
  static const String bathroom = "Bathroom";
  static const String Kitchen = "Kitchen";
  static const String kids = 'Kids Room';
  static const String receptions = "Receptions";
  static const String diningRoom = "Dining room";
  static const String modern = "Modern";
  static const String classic = "Classic";
  static const String minimalist = "Minimalist";
  static const String asion = "Asion";
  static const String scandinavion = "Scandinavion";
  static const String colonial = "Colonial";
  static String chat = S().chat;
  static String home = S().home;
  static String searchAppString = S().search;
  static String settingsString = S().sittings;
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
}

class OnBoardingAssets {
  static const image1 = 'assets/images/pana.png';
  static const image2 = 'assets/images/pana2.png';

  static const image3 = 'assets/images/rafiki.png';
  static const title1 = '';
  static const body1 = '';
  static const title2 = 'Discover The World Of Beauty';
  static const body2 =
      'Discover the world of beauty and creativity with our company’s images \nwhere wondrful ideas meet exceptional design';
  static const title3 = 'Direct communication with\n             the company';
  static const body3 =
      'Direct communication with \nthe company through a chat ';
  static String skip = S().skip;
  static String done = S().done;

  static String arabicButton = S().arabic;
  static String englishButton = S().english;
  static String selectLanguage = S().selectLanguage;
  static const signUpButton = 'Sign up';
  static const continueAsGuestButton = 'Conitnue as a Guest';
}

class EndPoints {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static String login = S().login;
  static String register = S().register;
  static String notifications = S().notifications;
  static String categories = S().category;
  static String home = S().home;
  static String favorites = S().favorite;
  static const String carts = 'carts';
  static const String addresses = 'addresses';
  static String orders = S().other;
}
