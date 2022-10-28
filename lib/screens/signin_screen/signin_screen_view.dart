import 'package:firebaseauthentication/screens/home_screen/home_screen_view.dart';
import 'package:firebaseauthentication/screens/signup_screen/signup_screen_view.dart';
import 'package:firebaseauthentication/services/firebase_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SigninScreenView extends StatefulWidget {
  const SigninScreenView({Key? key}) : super(key: key);

  @override
  State<SigninScreenView> createState() => _SigninScreenViewState();
}

class _SigninScreenViewState extends State<SigninScreenView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    bool result = await FirebaseAuthenticationService()
        .signIn(email: email.text, password: password.text);

    if (result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreenView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appBar(context),
        body: Container(
          height: 100.h -
              (appBar(context).preferredSize.height +
                  MediaQuery.of(context).padding.top),
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 27.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                controller: email,
                style: TextStyle(
                  fontSize: 17.sp,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    top: 4.w,
                    bottom: 4.w,
                    left: 5.w,
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 17.sp,
                  ),
                  suffixIcon: const Icon(Icons.email),
                ),
              ),
              SizedBox(height: 2.5.h),
              TextField(
                controller: password,
                style: TextStyle(
                  fontSize: 17.sp,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    top: 4.w,
                    bottom: 4.w,
                    left: 5.w,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 17.sp,
                  ),
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 3.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5.sp,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreenView(),
                            ),
                          );
                        },
                      text: " Sign up",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.5.sp,
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.5.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  appBar(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black54,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
