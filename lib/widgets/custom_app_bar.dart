import 'package:flutter/material.dart';
import 'package:skype_clone/utility/universal_vars.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({this.title, this.actions, this.leading, this.centerTitle});

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: UniversalVariables.blackColor,
        border: Border(
            bottom: BorderSide(
          color: UniversalVariables.separatorColor,
          width: 1.4,
          style: BorderStyle.solid,
        )),
      ),
      child: AppBar(
        backgroundColor: UniversalVariables.blackColor,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }
}
