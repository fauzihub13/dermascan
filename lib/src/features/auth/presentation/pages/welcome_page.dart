import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_dermascan/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_dermascan/src/shared/presentation/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Image.asset('assets/images/home_mockup.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: DefaultColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DefaultColors.lightGrey.withValues(alpha: 0.5),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'DermaScan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Unggah Foto, Kenali Kondisi Kulitmu dalam Sekejap.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: DefaultColors.grey,
                      ),
                    ),
                    const Spacer(),
                    CustomButton.filled(
                      onPressed: () {
                        // print('click');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const LoginPage();
                            },
                          ),
                        );
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
          ],
        ),
      ),
    );
  }
}
