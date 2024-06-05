import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/bottom_navigation_bar.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/local_network.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/theme.dart';
import 'package:flutter_final_graduation_project/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_final_graduation_project/features/favorite/cubit/favorite_cubit.dart';
import 'package:flutter_final_graduation_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/login_view.dart';
import 'package:flutter_final_graduation_project/features/profile/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/features/setting/bloc/swicth_bloc.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_final_graduation_project/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(
            create: (context) => CategoriesCubit()..getCategoriesData()),
        BlocProvider(create: (context) => HomeCubit()..getProducts()),
        BlocProvider(create: (context) => FavoriteCubit()..getFavorites()),
        BlocProvider(
          create: (context) => SwicthBloc(),
        )
      ],
      child: BlocBuilder<SwicthBloc, SwicthState>(
        builder: (context, state) {
          return GetMaterialApp(
            locale: Locale(PreferenceUtils.getString(PrefKeys.language, 'en')),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: token != null && token != ""
                ? const BottomNavigationBarHelper()
                : const SplashView(),
          );
        },
      ),
    );
  }
}
