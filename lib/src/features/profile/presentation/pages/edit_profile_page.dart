import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/helper/auth_local_helper.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter_dermascan/src/shared/domain/entities/user_entity.dart';
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
  UserEntity? user;

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _loadAuthData();
  }

  Future<void> _loadAuthData() async {
    final authData = await AuthLocalHelper().getAuthData();
    setState(() {
      user = authData.toEntity();
      nameController.text = user!.name;
      emailController.text = user!.email;
    });
  }

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
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  switch (state) {
                    case SuccessUpdateProfile():
                      CustomSnackbar.show(
                        context,
                        message: 'Berhasil ubah profil',
                        status: 'success',
                      );
                      nameController.clear();
                      emailController.clear();
                      context.pop();
                      break;
                    case ErrorUpdateProfile(:final failure):
                      CustomSnackbar.show(
                        context,
                        message: '${failure.message}',
                        status: 'success',
                      );
                  }
                },
                builder: (context, state) {
                  return CustomButton.filled(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ProfileBloc>().add(
                          ProfileEvent.updateProfile(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                        );
                      }
                    },
                    label: 'Simpan',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
