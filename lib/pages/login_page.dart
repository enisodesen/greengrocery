import 'package:flutter/material.dart';
import 'package:greengrocer/pages/products_page.dart';
import 'package:greengrocer/pages/signup_page.dart';
import 'package:greengrocer/widgets/custom_text_field.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_gesture_detector.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('W E L C O M E')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Image.asset(
                            'lib/images/manav.png',
                            width: 150,
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: const [
                        CustomTextField(
                            prefixIcon: Icons.person,
                            text: 'Enter your username...'),
                        CustomTextField(
                            prefixIcon: Icons.lock,
                            text: 'Enter your password...'),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            CustomElevatedButton(
                              text: 'LOGIN',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProductPage(),
                                    ));
                              },
                            ),
                          ],
                        ),
                        GestureDetectorButton(
                          text: 'Create an account.!',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
