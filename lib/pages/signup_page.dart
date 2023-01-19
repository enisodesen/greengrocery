import 'package:flutter/material.dart';
import 'package:greengrocer/hive/user.dart';
import 'package:greengrocer/pages/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_gesture_detector.dart';
import '../widgets/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Sign Up'))),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: Container(
                              color: Colors.blue,
                              child: const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    Column(
                      children: [
                        CustomTextField(
                            controller: nameController,
                            prefixIcon: Icons.person,
                            text: 'Enter your username...'),
                        CustomTextField(
                            controller: usernameController,
                            prefixIcon: Icons.person_add_alt_1_sharp,
                            text: 'Enter your name...'),
                        CustomTextField(
                            controller: passwordController,
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
                              text: 'SIGN UP',
                              onPressed: () {
                                final myBox = Hive.box<UserList>('userBox');

                                myBox.add(UserList(
                                    userName: nameController.text,
                                    name: usernameController.text,
                                    password: passwordController.text));

                                nameController.clear();
                                usernameController.clear();
                                passwordController.clear();
                              },
                            ),
                          ],
                        ),
                        GestureDetectorButton(
                          text: 'See the all users..',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Users(),
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
