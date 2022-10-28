import 'package:firebaseauthentication/constants/app_globals.dart';
import 'package:firebaseauthentication/screens/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: "Flutter Firebase Authentication",
          home: const SplashScreenView(),
          scaffoldMessengerKey: AppGlobals.snackbarKey,
        );
      },
    );
  }
}
