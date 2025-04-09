import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dermascan/src/core/router/route_name.dart';
import 'package:flutter_dermascan/src/core/router/route_page.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_card.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_row.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/label_action_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_snackbar.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                      const AssetImage('assets/images/profile.jpg')
                          as ImageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Jane Evelyn',
              style: TextStyle(
                fontSize: FontSize.standardUp2,
                fontWeight: FontWeight.w500,
                color: DefaultColors.darkBlue,
              ),
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
                  case Error(:final failure):
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
          ],
        ),
      ),
    );
  }
}
