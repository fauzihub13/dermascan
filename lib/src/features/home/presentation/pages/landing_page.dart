import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';
import 'package:flutter_dermascan/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter_dermascan/src/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [HomePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DefaultColors.lightBlue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: DefaultColors.primaryBlue,
        unselectedItemColor: DefaultColors.navbarDisable,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Material(
              color: DefaultColors.primaryBlue,
              shape: CircleBorder(
                side: BorderSide(color: DefaultColors.white, width: 5.0),
              ),
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 74,
                  width: 74,
                  child: SvgPicture.asset(
                    'assets/icons/icon_scan.svg',
                    colorFilter: const ColorFilter.mode(
                      DefaultColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
