import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_card.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_row.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/label_action_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/bloc/local_auth/local_auth_bloc.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  bool isClicked = false;

  Future<void> _initializeData() async {
    context.read<LocalAuthBloc>().add(LocalAuthEvent.getLocalAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Profil', canBack: false),
      body: Container(
        color: DefaultColors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: DefaultColors.lightGrey4, width: 2),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image:
                      const AssetImage('assets/images/profile_icon.png')
                          as ImageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            BlocConsumer<LocalAuthBloc, LocalAuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                String name = '-';
                switch (state) {
                  case SuccesGetLocalAuth(:final userEntity):
                    name = userEntity.name;
                    break;
                }
                return Text(
                  name,
                  style: TextStyle(
                    fontSize: FontSize.standardUp2,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.darkBlue,
                  ),
                );
              },
            ),
            LabelActionCard(label: 'AKUN'),
            ActionCard(
              list: [
                ActionRow(
                  label: 'Ubah Profil',
                  icon: Icons.person,
                  onPressed: () {
                    context.pushNamed(RouteName.editProfile);
                  },
                ),
                ActionRow(
                  label: 'Ubah Kata Sandi',
                  icon: Icons.lock,
                  onPressed: () {
                    context.pushNamed(RouteName.changePassword);
                  },
                ),
                ActionRow(
                  label: 'Riwayat Diagnosa',
                  icon: Icons.history,
                  onPressed: () {
                    context.pushNamed(RouteName.diagnoseHistoryPage);
                  },
                ),
              ],
            ),
            LabelActionCard(label: 'PENGATURAN'),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state) {
                  case SuccessLogout():
                    CustomSnackbar.show(
                      context,
                      message: 'Berhasil keluar akun.',
                      status: 'success',
                    );
                    RoutePage.isLoggedIn = false;
                    context.goNamed(RouteName.loginPage);
                    break;
                  case LogoutError(:final failure):
                    CustomSnackbar.show(
                      context,
                      message: '${failure.message}',
                      status: 'fail',
                    );
                    break;
                }
              },
              builder: (context, state) {
                return ActionCard(
                  list: [
                    ActionRow(
                      label: 'Keluar',
                      icon: Icons.logout,
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthEvent.logout());
                      },
                    ),
                  ],
                );
              },
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is SuccessDeleteAccount) {
                  CustomSnackbar.show(
                    context,
                    message: 'Berhasil menghapus akun.',
                    status: 'success',
                  );
                  RoutePage.isLoggedIn = false;
                  context.goNamed(RouteName.loginPage);
                } else if (state is ErrorDeleteAccount) {
                  CustomSnackbar.show(
                    context,
                    message: state.failur.message!,
                    status: 'fail',
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is LoadingDeleteAccount;
                return ActionCard(
                  color: DefaultColors.lightRedBadge.withValues(alpha: 0.3),
                  list: [
                    ActionRow(
                      label: 'Hapus Akun',
                      icon: Icons.delete,
                      color: DefaultColors.darkRedBadge,
                      onPressed: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(20),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  Text(
                                    'Yakin menghapus akun Anda?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: FontSize.standardUp2,
                                      fontWeight: FontWeight.w700,
                                      color: DefaultColors.darkBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  CustomButton.filled(
                                    onPressed:
                                        isLoading
                                            ? () {}
                                            : () =>
                                                context.read<ProfileBloc>().add(
                                                  ProfileEvent.deleteAccount(),
                                                ),
                                    label: 'Hapus',
                                    color: DefaultColors.darkRedBadge,
                                  ),
                                  CustomButton.filled(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    label: 'Kembali',
                                  ),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
