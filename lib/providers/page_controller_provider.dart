import 'package:flutter/material.dart';

class PageControllerProvider extends ChangeNotifier {
  PageController controller = PageController(initialPage: 0, keepPage: true);
  late int selectedPage = 0;

  PageController get getController => controller;
  int get getSelectedPage => selectedPage;

  set setSelectedPage(int selectedPage) {
    this.selectedPage = selectedPage;
    notifyListeners();
  }
}
