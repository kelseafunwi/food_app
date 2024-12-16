import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/constants/app_colors.dart';
import 'package:food_app/views/screens/chat_screen.dart';
import 'package:food_app/views/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ChatScreen(),
    Center(child: Text('Shop Page', style: TextStyle(fontSize: 24))),
    ChatScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavItem(Icons.home, 'Home', 0),
          _buildBottomNavItem(FontAwesomeIcons.bagShopping, 'Shop', 1),
          _buildBottomNavItem((Icons.message), 'Chat', 2),
          _buildBottomNavItem(Icons.person, 'Settings', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primaryOrange : AppColors.neutral60,
          ),
          if (isActive)
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primaryOrange,
              ),
            ),
        ],
      ),
      label: '', // Hides the default label
    );
  }
}
