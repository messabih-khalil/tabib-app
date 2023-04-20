import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.pushReplacementNamed(context, '/app-home');
    } else if (_selectedIndex == 1) {
      Navigator.pushReplacementNamed(context, '/specialities');
    } else if (_selectedIndex == 2) {
      Navigator.pushReplacementNamed(context, '/my-appointments');
    } else if (_selectedIndex == 3) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.lightGreyColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_hospital,
            color: AppColors.lightGreyColor,
          ),
          label: 'Specialities',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edit_document,
            color: AppColors.lightGreyColor,
          ),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColors.lightGreyColor,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
