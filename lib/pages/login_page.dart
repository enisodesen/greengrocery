// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:greengrocer/hive/user.dart';
import 'package:greengrocer/pages/products_page.dart';
import 'package:greengrocer/pages/signup_page.dart';
import 'package:greengrocer/widgets/custom_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_gesture_detector.dart';
import '../widgets/custom_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Box<UserList> _box;
  late List<UserList> _users;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _box = Hive.box<UserList>('userBox');
    _users = _box.values.toList();
  }

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
                      children: [
                        CustomTextField(
                            controller: _usernameController,
                            prefixIcon: Icons.person,
                            text: 'Enter your username...'),
                        CustomTextField(
                            controller: _passwordController,
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
                                final user = _users
                                    .where((user) =>
                                        user.userName ==
                                            _usernameController.text &&
                                        user.password ==
                                            _passwordController.text)
                                    .toList();
                                if (user.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductPage(),
                                      ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const CustomSnackBar(
                                      content: Text(
                                        'Invalid username or password!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  );
                                }
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
