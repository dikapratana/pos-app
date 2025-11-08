import 'package:flutter/material.dart';

import '../../../../widgets/mainlayout/form/textfield/textfield_widget.dart';
import '../../../../widgets/mainlayout/main_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextfieldWidget(
              label: 'Username',
              hint: 'Masukkan username kamu',
              prefixIcon: Icon(Icons.person),
            ),
            SizedBox(height: 16),
            TextfieldWidget(
              label: 'Password',
              hint: 'Masukkan password kamu',
              prefixIcon: Icon(Icons.lock),
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
