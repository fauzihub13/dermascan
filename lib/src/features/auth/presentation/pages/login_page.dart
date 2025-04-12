import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/local_auth/local_auth_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void dispose() {
    formKey.currentState?.reset();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            width: double.infinity,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Masuk',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSize.large,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.primaryBlue,
                      ),
                    ),
                    const Text(
                      'Hai, selamat datang kembali!',
                      style: TextStyle(
                        color: DefaultColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: FontSize.standardUp,
                      ),
                    ),
                    const SizedBox(height: 40),
                    FormLabel(label: 'Email'),
                    FormInput(
                      controller: emailController,
                      hintText: 'Masukan email Anda',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    FormLabel(label: 'Kata Sandi'),
                    FormInput(
                      controller: passwordController,
                      obscureText: isPasswordVisible,
                      hintText: 'Masukan kata sandi Anda',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 60),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        switch (state) {
                          case SuccessLogin(:final userEntity):
                            CustomSnackbar.show(
                              context,
                              message:
                                  'Berhasil masuk sebagai ${userEntity.name}',
                              status: 'success',
                            );
                            context.read<LocalAuthBloc>().add(
                              LocalAuthEvent.saveLocalAuth(userEntity),
                            );
                            RoutePage.isLoggedIn = true;
                            context.goNamed(RouteName.landingPage);
                            break;
                          case LoginError(:final failure):
                            CustomSnackbar.show(
                              context,
                              message: '${failure.message}',
                              status: 'fail',
                            );
                            break;
                        }
                      },
                      builder: (context, state) {
                        String label = 'Masuk';
                        VoidCallback onPressed = () {};
                        
                        if (state is! LoadingLogin) {
                          onPressed = () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                AuthEvent.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          };
                        }

                        switch (state) {
                          case LoadingLogin():
                            label = 'Memproses...';
                            break;
                          case SuccessLogin():
                            label = 'Berhasil masuk';
                            break;
                        }
                        return CustomButton.filled(
                          onPressed: onPressed,
                          label: label,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: TextStyle(
                            fontSize: FontSize.standardUp,
                            color: DefaultColors.lightGrey,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: DefaultColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size(0, 0),
                          ),
                          onPressed: () {
                            context.pushNamed(RouteName.registerPage);
                          },
                          child: Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: FontSize.standardUp,
                              fontWeight: FontWeight.w600,
                              color: DefaultColors.primaryBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
