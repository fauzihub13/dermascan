import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmationPasswordController =
      TextEditingController();

  bool isOldPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isPasswordConfirmationVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ubah Kata Sandi', canBack: true),
      body: Container(
        width: double.infinity,
        color: DefaultColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              FormLabel(label: 'Kata Sandi lama'),
              FormInput(
                controller: oldPasswordController,
                obscureText: isOldPasswordVisible,
                hintText: 'Masukan kata sandi yang lama',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isOldPasswordVisible = !isOldPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isOldPasswordVisible
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
              const SizedBox(height: 8),
              FormLabel(label: 'Kata Sandi Baru'),
              FormInput(
                controller: newPasswordController,
                obscureText: isNewPasswordVisible,

                hintText: 'Masukan kata sandi baru',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  } else if (value.length < 9) {
                    return 'Kata sandi harus lebih dari 8 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              FormLabel(label: 'Ulangi Kata Sandi Baru'),
              FormInput(
                controller: confirmationPasswordController,
                obscureText: isPasswordConfirmationVisible,

                hintText: 'Ulangi kata sandi baru',
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
                  } else if (value != newPasswordController.text) {
                    return 'Kata sandi baru tidak cocok';
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
                      message: 'Berhasil ubah profil',
                      status: 'success',
                    );
                    context.pop();
                  } else {
                    CustomSnackbar.show(
                      context,
                      message: 'Gagal ubah profil, silahkan coba kembali',
                      status: 'fail',
                    );
                  }
                },
                label: 'Simpan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
