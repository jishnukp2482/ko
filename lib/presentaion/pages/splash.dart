import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../themes/app_assets.dart';
import 'auth/loginpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigatepage();
  }

  _navigatepage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 167, 111, 125)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.4,
                width: width * 0.76,
                child: Image.asset(
                  AppAssets.splash,
                  fit: BoxFit.cover,
                ),
              ),
              Text("Club",
                  style: GoogleFonts.handlee(
                    textStyle:
                        const TextStyle(fontSize: 40, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
