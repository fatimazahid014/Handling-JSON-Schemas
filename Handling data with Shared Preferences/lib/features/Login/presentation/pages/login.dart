import 'package:flutter/material.dart';
import 'package:lab_07/features/Login/data/repository/login_repository.dart';

import '../../../Profile/data/model/profile.dart';
import '../widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  InputFieldWidget(
                    controller: _emailController,
                    prefixIcon: Icons.email_outlined,
                    placeholder: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  InputFieldWidget(
                    controller: _passwordController,
                    prefixIcon: Icons.lock_outline,
                    placeholder: "Password",
                    inputType: TextInputType.text,
                    hasFab: true,
                    fabStates: const [
                      Icons.visibility_outlined,
                      Icons.visibility_off_outlined,
                    ],
                    fabType: "password",
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: const Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: const EdgeInsets.all(0),
                          visualDensity: VisualDensity.compact,
                          value: _isRememberMe,
                          onChanged: (newVal) => setState(
                            () {
                              _isRememberMe = !_isRememberMe;
                            },
                          ),
                        ),
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () async {
                        await LoginRepository.setFlag(_isRememberMe);
                        Navigator.pushNamed(
                          context,
                          "/profile",
                          arguments: Profile(
                            name: "Fatima Zahid",
                            image: "assets/images/avatar.png",
                            phone: "+92 123 1234567",
                            email: "fzahid.bscs19seecs@seecs.edu.pk",
                            address: "NUST, H-12, Islamabad",
                            biometric: true,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                          Colors.blue[700],
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
