import 'package:firebaseauthentication/screens/signin_screen/signin_screen_view.dart';
import 'package:firebaseauthentication/services/firebase_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  signOut() async {
    await FirebaseAuthenticationService().signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SigninScreenView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Firebase Authentication"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: 15.w,
                    width: 15.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset("assets/images/flutter-logo.png"),
                  ),
                  Container(
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5.w,
                    ),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                signOut();
              },
              leading: const Icon(Icons.logout),
              title: Text(
                "Sign out",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
