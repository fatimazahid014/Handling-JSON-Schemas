import 'package:flutter/material.dart';
import 'package:lab_07/features/Splash/data/repository/splash_repository.dart';

import '../../../Profile/data/model/profile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1, milliseconds: 500),
      () async {
        if (await SplashRepository.checkFlag()) {
          Navigator.pushNamed(
            context,
            "/profile",
            arguments: Profile(
              name: "Fatima  Zahid",
              image: "assets/images/avatar.png",
              phone: "+92 123 1234567",
              email: "fzahid.bscs19seecs@seecs.edu.pk",
              address: "NUST, H-12, Islamabad",
              biometric: true,
            ),
          );
        } else {
          Navigator.pushNamed(context, "/login");
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
