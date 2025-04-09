import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isPasswordVisible = true;
  bool isPasswordConfirmationVisible = true;

  @override
  void dispose() {
    formKey.currentState?.reset();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Daftar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.large,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.primaryBlue,
                    ),
                  ),
                  const Text(
                    'Hai, silahkan buat akun untuk masuk!',
                    style: TextStyle(
                      color: DefaultColors.lightGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.standardUp,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FormLabel(label: 'Nama Lengkap'),
                  FormInput(
                    controller: nameController,
                    hintText: 'Masukan nama lengkap Anda',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
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
                        return 'Kata Sandi tidak boleh kosong';
                      } else if (value.length < 9) {
                        return 'Kata sandi harus lebih dari 8 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  FormLabel(label: 'Konfirmasi Kata Sandi'),
                  FormInput(
                    controller: passwordConfirmationController,
                    obscureText: isPasswordConfirmationVisible,
                    hintText: 'Ulangi kata sandi Anda',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordConfirmationVisible =
                              !isPasswordConfirmationVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordConfirmationVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      } else if (value != passwordController.text) {
                        return 'Konfirmasi kata sandi tidak cocok';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      switch (state) {
                        case (SuccessRegister()):
                          CustomSnackbar.show(
                            context,
                            message: 'Berhasil mendaftarkan akun',
                            status: 'success',
                          );
                          context.goNamed(RouteName.loginPage);
                          break;
                        case (Error(:final failure)):
                          CustomSnackbar.show(
                            context,
                            message: '${failure.message}',
                            status: 'fail',
                          );
                          break;
                      }
                    },
                    builder: (context, state) {
                      return CustomButton.filled(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              AuthEvent.register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirmation:
                                    passwordConfirmationController.text,
                              ),
                            );
                          }
                        },
                        label: 'Daftar',
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
                          context.goNamed(RouteName.loginPage);
                        },
                        child: Text(
                          'Masuk',
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
    );
  }
}
