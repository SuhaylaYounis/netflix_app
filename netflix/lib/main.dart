import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/Home%20screen/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';


void main() {
  //Responsive when in landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  //assing provider to main (MyApp) to be able to be accessed to all screens
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //textTheme: GoogleFonts.arvoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.red,
      ),
      home: AnimatedSplashScreen(
        duration: 1730,
        splash:
        Image.asset(
          "images/netflix-netflix-startup.gif",
          fit:BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        nextScreen: HomeScreen(),
        backgroundColor: primarydarkcolor,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
