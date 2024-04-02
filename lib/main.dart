import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/Logic/cubit/user_cubit.dart';
import 'package:flutter_final_graduation_project/cache/cache_helper.dart';
import 'package:flutter_final_graduation_project/core/utils/theme.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/category_view.dart';
import 'package:flutter_final_graduation_project/features/categories/presentation/views/widgets/category_view_body.dart';
import 'package:flutter_final_graduation_project/features/chat/presentation/views/chat_view.dart';
import 'package:flutter_final_graduation_project/features/details/views/details_view.dart';
import 'package:flutter_final_graduation_project/features/favorite/presentation/view/favorite_view.dart';
import 'package:flutter_final_graduation_project/features/filter/presentation/views/fiter_view.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/language/views/language_view.dart';
import 'package:flutter_final_graduation_project/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_final_graduation_project/features/setting/views/settings_screen.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_final_graduation_project/repositories/user_repository.dart';
import 'package:get/get.dart';

import 'network/api/dio_consumer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      home: SplashView(),
    );
  }
}
