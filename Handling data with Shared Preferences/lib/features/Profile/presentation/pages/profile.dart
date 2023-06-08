import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lab_07/features/Profile/data/repository/profile_repository.dart';

import '../../data/model/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context)!.settings.arguments as Profile;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        actions: [
          TextButton(
            onPressed: () {
              ProfileRepository.removeFlag();
              Navigator.pop(context);
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.15,
                backgroundImage: Image.asset(profile.image).image,
              ),
              const SizedBox(height: 20),
              Text(
                profile.name,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Phone",
                            style: TextStyle(
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              profile.phone,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              profile.email,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Biometric",
                            style: TextStyle(
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: SizedBox()),
                          FlutterSwitch(
                            width: 45.0,
                            height: 25.0,
                            value: profile.biometric,
                            borderRadius: 30.0,
                            padding: 2.0,
                            disabled: true,
                            onToggle: (val) {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Address",
                            style: TextStyle(
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              profile.address,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/profile/top_nav"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Colors.blue[700],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Top Tab Navigation",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/profile/bottom_nav"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Colors.blue[700],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: Text(
                      "Bottom Tab Navigation",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
