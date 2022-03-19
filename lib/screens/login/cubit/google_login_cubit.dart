import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign extends Cubit {
  GoogleSign(initialState) : super(initialState);
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  final googleSignin = GoogleSignIn();

  Future googleLogin() async {
    final googleUser = await googleSignin.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credentials);
  }
}
