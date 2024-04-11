import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/local_network.dart';

import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/core/utils/theme.dart';
import 'package:flutter_final_graduation_project/features/home/presentation/views/home_view.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/auth_cubit/auth_cubit.dart';
import 'package:flutter_final_graduation_project/features/login_and_signUp/presentation/views/login_view.dart';
import 'package:flutter_final_graduation_project/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_final_graduation_project/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await CacheNetwork.cacheInitialization();
  token = CacheNetwork.getCacheData(key: "token");
  print("token is : $token");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
        ],
        child: MaterialApp(
          locale: Locale(PreferenceUtils.getString(PrefKeys.language, 'en')),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          home: token != null && token != "" ? HomeView() : LoginScreen(),
        ));
  }
}
