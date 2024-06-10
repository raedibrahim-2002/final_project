import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/local/local.dart';
import 'package:flutter_final_graduation_project/core/local/local_controller.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/local_network.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/styles.dart';
import 'package:flutter_final_graduation_project/core/utils/theme.dart';
import 'package:flutter_final_graduation_project/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_final_graduation_project/features/favorite/cubit/favorite_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/login_view.dart';
import 'package:flutter_final_graduation_project/features/profile/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/features/setting/cubit/setting_cubit.dart';

import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_final_graduation_project/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await CacheNetwork.cacheInitialization();
  token = CacheNetwork.getCacheData(key: "token");
  // currentPassword = CacheNetwork.getCacheData(key: "token");
  // debugPrint("token is : $token");
  // debugPrint("currentPassword is : $currentPassword");

  runApp(const MyApp());
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => SettingCubit()),
        BlocProvider(
            create: (context) => CategoriesCubit()..getCategoriesData()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeDesigns()
              ..getAllDesigns()),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          MyLocalController controller = Get.put(MyLocalController());
          return GetMaterialApp(
            locale: controller.initialLang,
            translations: MyLocal(),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white),
              drawerTheme:
                  const DrawerThemeData(backgroundColor: BaseColors.whiteColor),
              colorScheme: const ColorScheme.light(
                background: Colors.white,
                primary: BaseColors.primaryColor,
                secondary: Color(0xffC4C4C4),
              ),
              dividerColor: const Color(0xff757575),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
              textTheme: textThemeCustom(),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: BaseColors.blackColor),
                  color: BaseColors.whiteColor),
              iconTheme: const IconThemeData(
                color: BaseColors.black12,
                size: 28,
              ),
            ),
            darkTheme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
              ),
              colorScheme: const ColorScheme.dark(
                primary: Color(0xffA9BBF7),
                secondary: Color(0xffC4C4C4),
                background: Colors.black,
              ),
              drawerTheme:
                  const DrawerThemeData(backgroundColor: BaseColors.blackColor),
              textTheme: TextTheme(
                  titleMedium:
                      getRegularTextStylePoppins(color: BaseColors.grey),
                  displayLarge:
                      getBoldTextStyleInter(color: BaseColors.whiteColor),
                  displayMedium: getMediumTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 20),
                  displaySmall: getSemiBoldTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 16),
                  bodyLarge: getSemiBoldTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 18),
                  headlineMedium: getMediumTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 16),
                  headlineSmall: getMediumTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 12),
                  bodyMedium: getRegularTextStyleInter(
                      color: BaseColors.grey, fontSize: 12),
                  labelMedium: getRegularTextStyleInter(
                      fontSize: 16, color: BaseColors.grey),
                  bodySmall: getRegularTextStyleInter(
                      color: BaseColors.whiteColor, fontSize: 10),
                  labelLarge: getMediumTextStylePoppins(
                      color: BaseColors.whiteColor, fontSize: 14)),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: BaseColors.whiteColor),
                  color: BaseColors.blackColor),
              iconTheme: const IconThemeData(
                color: BaseColors.whiteColor,
                size: 28,
              ),
            ),
            themeMode: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? ThemeMode.dark
                : ThemeMode.light,
            home: token != null && token != ""
                ? const BottomNavigationBarHelper()
                : const SplashView(),
          );
        },
      ),
    );
  }
}
