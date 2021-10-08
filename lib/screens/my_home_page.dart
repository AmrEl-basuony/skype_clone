import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/providers/google_sign_in_provider.dart';
import 'package:skype_clone/providers/page_controller_provider.dart';
import 'package:skype_clone/utility/universal_vars.dart';

import 'chats_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    PageController controller =
        Provider.of<PageControllerProvider>(context, listen: false)
            .getController;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<PageControllerProvider>().getSelectedPage,
        onTap: (index) {
          Provider.of<PageControllerProvider>(context, listen: false)
              .setSelectedPage = index;
          controller.animateToPage(
              Provider.of<PageControllerProvider>(context, listen: false)
                  .getSelectedPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease);
        },
        selectedItemColor: UniversalVariables.blueColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contacts",
          )
        ],
      ),
      body: PageView(
        children: [
          // Page 1 //
          StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (true /*snapshot.hasData*/) {
                  return Center(
                    child: Column(
                      children: [
                        Text("data")
                        /*Text(user!.uid),
                        Text(user.emailVerified.toString()),
                        Text(user.email!),*/
                      ],
                    ),
                  );
                }
              }),
          // Page 2 //
          ChatsListPage(),
          // Page 3 //
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin().then((data) {
                      provider.addUserToDB(user!);
                    });
                  },
                  child: const Text("Google sign in"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                  },
                  child: const Text("Google sign out"),
                ),
              ],
            ),
          ),
        ],
        controller: controller,
        onPageChanged: (index) {
          Provider.of<PageControllerProvider>(context, listen: false)
              .setSelectedPage = index;
        },
      ),
    );
  }
}
