import 'package:firebaseauthentication/screens/home_screen/home_screen_view.dart';
import 'package:firebaseauthentication/services/firebase_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreenView extends StatefulWidget {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  State<SignupScreenView> createState() => _SignupScreenViewState();
}

class _SignupScreenViewState extends State<SignupScreenView> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    bool result = await FirebaseAuthenticationService()
        .signUp(email: email.text, password: password.text);

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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 27.sp,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: TextField(
                      controller: firstName,
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
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: TextField(
                      controller: lastName,
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
                        hintText: "Last Name",
                        hintStyle: TextStyle(
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.5.h),
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
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: Text(
                  "Sign up",
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
