import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_clone/utility/universal_vars.dart';
import 'package:skype_clone/widgets/custom_app_bar.dart';
import 'package:skype_clone/widgets/custom_tile.dart';

class ChatsListPage extends StatefulWidget {
  ChatsListPage({Key? key}) : super(key: key);

  @override
  _ChatsListPageState createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: UniversalVariables.greyColor,
        child: Icon(Icons.edit),
      ),
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: UniversalVariables.whiteColor,
          ),
        ),
        title: CircleAvatar(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
            icon: Icon(
              Icons.search,
              color: UniversalVariables.whiteColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: UniversalVariables.whiteColor,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return CustomTile(
            mini: false,
            onTap: () {},
            onLongPress: () {},
            title: Text("data"),
            subtitle: Text("msg"),
            leading: CircleAvatar(),
            trailing: Text("trailing"),
            icon: Text("icon"),
          );
        },
      ),
    );
  }
}
