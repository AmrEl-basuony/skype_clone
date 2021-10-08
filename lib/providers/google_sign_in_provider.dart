import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skype_clone/models/my_user.dart';
import 'package:skype_clone/utility/functions.dart';

class GoogleSignInProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // The current user instance
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future<void> addUserToDB(User user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();
    final List<DocumentSnapshot> docs = result.docs;

    //if user is registered then length of list > 0 or else less than 0
    if (docs.isEmpty) {
      String username = Functions.extractUserName(user.email!);

      MyUser myuser = MyUser(
          uid: user.uid,
          name: user.displayName!,
          email: user.email!,
          username: username,
          profilePhoto: user.photoURL);

      await firestore.collection("users").doc(user.uid).set(myuser.toMap());
    }
  }

  Future logout() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await GoogleSignIn().disconnect();
      FirebaseAuth.instance.signOut();
    }
    notifyListeners();
  }

  Future<List<MyUser>> fetchAllUsers(User currentUser) async {
    List<MyUser> userList = [];

    QuerySnapshot querySnapshot = await firestore.collection("users").get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(MyUser.fromMap(
            querySnapshot.docs[i].data() as Map<String, dynamic>));
      }
    }
    return userList;
  }
}
