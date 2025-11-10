import 'package:flutter/material.dart';
import 'package:pos_resto_app/app/core/theme/app_colors.dart';
import 'package:pos_resto_app/app/widgets/text/text_widget.dart';

import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/gradient/gradient_container_widget.dart';
import '../../../../widgets/mainlayout/form/textfield/textfield_widget.dart';
import '../../../../widgets/mainlayout/main_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).viewInsets.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientContainerWidget(
                    gradientBorder: true,
                    borderWidth: 8,
                    borderRadius: 100,
                    padding: EdgeInsetsGeometry.all(16),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: AppColor.primary1,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextWidget(
                    'POS APP',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    gradient: const LinearGradient(
                      colors: [AppColor.primary1, AppColor.primary2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  SizedBox(height: 32),
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
                  SizedBox(height: 32),
                  ButtonWidget(
                    label: 'Masuk',
                    onPressed: () {
                      print('object');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
