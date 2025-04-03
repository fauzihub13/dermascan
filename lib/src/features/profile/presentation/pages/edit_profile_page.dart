import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_input.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/form_label.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Ubah Profil', canBack: true),
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
              FormLabel(label: 'Nama Lengkap'),
              FormInput(
                controller: nameController,
                hintText: 'Masukan nama Anda',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
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
