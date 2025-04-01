import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';

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
                  CustomButton.filled(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        CustomSnackbar.show(
                          context,
                          message: 'Berhasil masuk',
                          status: 'success',
                        );
                      } else {
                        CustomSnackbar.show(
                          context,
                          message: 'Gagal masuk ke akun, periksa kembali email dan kata sandi.',
                          status: 'fail',
                        );
                      }
                    },
                    label: 'Masuk',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const RegisterPage();
                              },
                            ),
                          );
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
    );
  }
}
