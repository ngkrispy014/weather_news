import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_news_app/components/dialog.dart';
import 'package:weather_news_app/models/ApplicationUser.dart';
import 'package:weather_news_app/services/FirestoreService.dart';

enum LoadingStatus { completed, searching, empty }

class AuthNotifier with ChangeNotifier {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoadingStatus loadingStatus = LoadingStatus.empty;

  final fb = FacebookLogin();

  final _firestoreService = FirestoreService();

  final googleSignIn = GoogleSignIn(scopes: ['email']);

  gotoLanding(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  signinGoogle(context) async {
    Dialogs.showLoadingDialog(context, _keyLoader);

    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      final result = await _auth.signInWithCredential(credential);
      var existingUser = await _firestoreService.fetchUser(result.user.uid);
      var user =
          ApplicationUser(userId: result.user.uid, email: result.user.email);

      if (existingUser == null) {
        await _firestoreService.addUser(user);

        await Future.delayed(Duration(seconds: 2));
        Navigator.of(_keyLoader.currentContext, rootNavigator: true)
            .pop(); //close the dialoge
        gotoLanding(context, '/landing');
      } else {
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
        gotoLanding(context, '/landing');
      }
    } catch (error) {
      debugPrint('Google Auth Failed');
      print(error);
    }
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    var firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return false;

    var user = await _firestoreService.fetchUser(firebaseUser.uid);
    if (user == null) return false;

    return true;
  }

  signinFacebook(context) async {
    Dialogs.showLoadingDialog(context, _keyLoader);

    final res = await fb.logIn(['public_profile', 'email']);
    switch (res.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken fbToken = res.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);
        final result = await _auth.signInWithCredential(credential);

        var existingUser = await _firestoreService.fetchUser(result.user.uid);
        var user =
            ApplicationUser(userId: result.user.uid, email: result.user.email);

        if (existingUser == null) {
          await _firestoreService.addUser(user);
          await Future.delayed(Duration(seconds: 2));
          Navigator.of(_keyLoader.currentContext, rootNavigator: true)
              .pop(); //close the dialoge
          gotoLanding(context, '/landing');
        } else {
          await Future.delayed(Duration(seconds: 2));
          Navigator.of(_keyLoader.currentContext, rootNavigator: true)
              .pop(); //close the dialoge
          gotoLanding(context, '/landing');
        }
        notifyListeners();
        break;
      case FacebookLoginStatus.cancelledByUser:
        debugPrint('CancelledByUser');
        this.loadingStatus = LoadingStatus.completed;
        Navigator.of(_keyLoader.currentContext, rootNavigator: true)
            .pop(); //close the dialoge

        break;
      case FacebookLoginStatus.error:
        debugPrint('Facebook Auth Failed');
        debugPrint(res.errorMessage);
        this.loadingStatus = LoadingStatus.completed;

        break;
    }
  }

  Future signOut(context) async {
    try {
      return await _signOut(context);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> _signOut(BuildContext context) {
    return showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Do you want to exit this application?'),
            content: Text('We hate to see you leave...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
