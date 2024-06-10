import 'package:flutter/cupertino.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController {
  Locale initialLang = PreferenceUtils.getString(PrefKeys.language) == "ar"
      ? Locale("en")
      : Locale("ar");
  changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    PreferenceUtils.setString(PrefKeys.language, codeLang);
    Get.updateLocale(locale);
  }
}
