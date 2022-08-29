import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/domain/locale_provider/locale_provider.dart';
import 'package:to_do_list_app/domain/to_do_provider/to_do_provider.dart';
import 'package:to_do_list_app/generated/l10n.dart';
import 'package:to_do_list_app/ui/app_navigator/app_navigator.dart';
import 'package:to_do_list_app/ui/themes/app_colors.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    S.load(const Locale('ru'));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoProvider>(create: (_) => ToDoProvider()),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
      ],
      child: const AppContent(),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Provider.of<LocaleProvider>(context).locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        appBarTheme: const AppBarTheme().copyWith(
          toolbarHeight: 64,
          backgroundColor: AppColors.backgroundColor,
          iconTheme: const IconThemeData().copyWith(
            color: AppColors.lightDarkColor,
          ),
        ),
        iconTheme: const IconThemeData().copyWith(
          color: AppColors.lightDarkColor,
        ),
      ),
      initialRoute: AppNavigator.initRoute,
      routes: AppNavigator.routes,
      onGenerateRoute: AppNavigator.generateRoute,
    );
  }
}
