import 'package:flutter/material.dart';
import 'package:to_do_list_app/ui/app_navigator/app_routes.dart';
import 'package:to_do_list_app/ui/pages/controll_notes/controll_notes.dart';
import 'package:to_do_list_app/ui/pages/home_page/home_page.dart';
import 'package:to_do_list_app/ui/pages/search_page/search_page.dart';
import 'package:to_do_list_app/ui/themes/text_styles.dart';

abstract class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.search: (context) => const SearchPage(),
      AppRoutes.addNotes: (context) => const ControllNotes(),
      AppRoutes.changeNotes: (context) => const ControllNotes(isChange: true),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteSettings newSettings = settings.copyWith(name: '/404');

    return MaterialPageRoute(
      settings: newSettings,
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Страница не найдена || 404',
              style: TextStyles.appBarTitle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
