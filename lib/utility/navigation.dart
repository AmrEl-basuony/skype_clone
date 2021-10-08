import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/providers/page_controller_provider.dart';
import 'package:skype_clone/screens/my_home_page.dart';
import 'package:skype_clone/screens/search_page.dart';

class Navigation {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => ChangeNotifierProvider(
          create: (context) => PageControllerProvider(),
          child: MyHomePage(),
        ),
    '/search': (context) => ChangeNotifierProvider(
          create: (context) => PageControllerProvider(),
          child: SearchPage(),
        ),
  };
}
