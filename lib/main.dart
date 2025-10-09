import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/app_routes.dart';
import 'package:fruits_hub/core/helper_functions/route_manager/route_generator.dart';
import 'package:fruits_hub/core/sevices/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  runApp(FriutsHub());
}

class FriutsHub extends StatelessWidget {
  const FriutsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
        ),
        locale: const Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,

        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashView,
        onGenerateRoute: (settings) => onGenerateRoutes(settings),
      ),
    );
  }
}
