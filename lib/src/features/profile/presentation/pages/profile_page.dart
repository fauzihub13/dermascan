import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/change_password_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/history_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_card.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/action_row.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/widgets/label_action_card.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_appbar.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return EditProfilePage();
                        },
                      ),
                    );
                  },
                ),
                ActionRow(
                  label: 'Ubah Kata Sandi',
                  icon: Icons.lock,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChangePasswordPage();
                        },
                      ),
                    );
                  },
                ),
                ActionRow(
                  label: 'Riwayat Diagnosa',
                  icon: Icons.history,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return HistoryPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            LabelActionCard(label: 'PENGATURAN'),
            ActionCard(
              list: [
                ActionRow(
                  label: 'Keluar',
                  icon: Icons.logout,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
