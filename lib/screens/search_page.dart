import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/models/my_user.dart';
import 'package:skype_clone/providers/google_sign_in_provider.dart';
import 'package:skype_clone/utility/universal_vars.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String query = "";
  final user = FirebaseAuth.instance.currentUser;
  List<MyUser> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: NewGradientAppBar(
        gradient: UniversalVariables.fabGradient,
        elevation: 0,
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: TextField(
                controller: searchController,
                cursorColor: UniversalVariables.blackColor,
                autofocus: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UniversalVariables.whiteColor,
                    fontSize: 24),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: UniversalVariables.transparentGreyColor,
                      fontSize: 24),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: UniversalVariables.whiteColor,
                    ),
                    onPressed: () {
                      searchController.clear();
                    },
                  ),
                ),
                onChanged: (val) {
                  if (val.length >= 3) {
                    query = val;
                  }
                },
              ),
            ),
            preferredSize: const Size.fromHeight(kToolbarHeight + 20)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: UniversalVariables.whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20),child: ,),
    );
  }
}
