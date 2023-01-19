import 'package:flutter/material.dart';
import 'package:greengrocer/pages/users.dart';
import 'package:greengrocer/widgets/custom_elevated_button.dart';

import '../widgets/custom_snackbar.dart';
import '../widgets/custom_text_field.dart';

class AlertPage extends StatelessWidget {
  AlertPage({super.key});

  final _nameContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Admin Login'))),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/alert.png',
                    width: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Only the ADMIN can access this page!',
                    style: TextStyle(fontSize: 18),
                  ),
                  CustomTextField(
                      controller: _nameContoller,
                      text: 'Enter your username',
                      prefixIcon: Icons.admin_panel_settings),
                  CustomTextField(
                      controller: _passwordContoller,
                      text: 'Enter your username',
                      prefixIcon: Icons.lock),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomElevatedButton(
                          text: 'GO',
                          onPressed: () {
                            if (_nameContoller.text == 'admin' &&
                                _passwordContoller.text == '12345') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Users(),
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
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
