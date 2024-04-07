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
  static const String generalText = 'General';
  static const String fontfamilyMonserrat = "Montserrat";
  static const String fontfamilyPoppins = "Poppins";
  static const String fontfamilyInter = "Inter";
  static String theme = S().theme;
  static String language = S().language;
  static String eng = S().english;
  static const String notifications = "Notifications";
  static const String account = "Account";
  static const String profile = "Profile";
  static const String other = "Other";
  static const String privacyPolicy = "Privacy Policy";
  static const String aboutUs = "About Us";
  static const String favorite = "Favorite";
  static const String category = "Category";
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
  static const chat = "Chat";
  static const home = "Home";
  static const searchAppString = "Search";
  static const inviteFriendsString = "Invite friends";
  static const settingsString = "Settings";
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
  static const skip = 'Skip';
  static const done = 'Done';

  static const arabicButton = 'عربي';
  static const englishButton = 'English';
  static const signUpButton = 'Sign Up';
  static const continueAsGuestButton = 'Conitnue as a Guest';
}

class EndPoints {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String notifications = 'notifications';
  static const String categories = 'categories';
  static const String home = 'home';
  static const String favorites = 'favorites';
  static const String carts = 'carts';
  static const String addresses = 'addresses';
  static const String orders = 'orders';
}
