import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_resto_app/app/core/theme/app_colors.dart';
import 'package:pos_resto_app/app/features/auth/login/model/login_request_model.dart';
import 'package:pos_resto_app/app/widgets/text/text_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/gradient/gradient_container_widget.dart';
import '../../../../widgets/reactive_form/reactive_textfield/reactive_textfield_widget.dart';
import '../../../../widgets/mainlayout/main_layout.dart';
import '../bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = FormGroup({
    'username': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(8)],
    ),
  });

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  media.size.height -
                  media.padding.top -
                  media.viewInsets.bottom,
            ),
            child: IntrinsicHeight(
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (response) {
                      // ✅ Navigasi atau simpan token di sini
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Login berhasil!')),
                      // );
                      // context.go('/home'); // contoh redirect
                    },
                    error: (error) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text(error.message ?? 'Login gagal')),
                      // );
                    },
                  );
                },
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  return ReactiveForm(
                    formGroup: form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientContainerWidget(
                          gradientBorder: true,
                          borderWidth: 8,
                          borderRadius: 100,
                          padding: const EdgeInsets.all(16),
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            size: 80,
                            color: AppColor.primary1,
                          ),
                        ),
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 32),
                        ReactiveTextfieldWidget(
                          formControlName: 'username',
                          label: 'Username',
                          hint: 'Masukkan username kamu',
                          prefixIcon: const Icon(Icons.person_outline),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Username wajib diisi',
                            ValidationMessage.email: (_) =>
                                'Username harus berisi email yang valid',
                          },
                        ),
                        const SizedBox(height: 16),
                        ReactiveTextfieldWidget(
                          formControlName: 'password',
                          label: 'Password',
                          hint: 'Masukkan password kamu',
                          isPassword: true,
                          prefixIcon: const Icon(Icons.lock_outline),

                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Password wajib diisi',
                            ValidationMessage.minLength: (_) =>
                                'Password minimal 8 karakter',
                          },
                        ),

                        const SizedBox(height: 32),
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                            final isFormValid = form.valid;

                            return ButtonWidget(
                              label: isLoading ? null : 'Masuk',
                              isLoading: isLoading,
                              isDisabled: !isFormValid,
                              onPressed: () {
                                final username = form.control('username').value;
                                final password = form.control('password').value;
                                context.read<LoginBloc>().add(
                                  LoginEvent.submit(
                                    LoginRequestModel(
                                      username: username,
                                      password: password,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
