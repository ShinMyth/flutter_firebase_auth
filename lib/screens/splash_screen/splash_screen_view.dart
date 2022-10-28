import 'package:firebaseauthentication/screens/home_screen/home_screen_view.dart';
import 'package:firebaseauthentication/screens/signin_screen/signin_screen_view.dart';
import 'package:firebaseauthentication/services/firebase_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    // Navigate to signin or home screen after 2.5 seconds
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FirebaseAuthenticationService().auth.currentUser == null
                    ? const SigninScreenView()
                    : const HomeScreenView(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 35.w,
          width: 35.w,
          child: Image.asset("assets/images/flutter-logo-with-label.png"),
        ),
      ),
    );
  }
}
