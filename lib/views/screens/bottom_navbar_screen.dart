import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_culture/controller/streak_controller.dart';
import 'package:urban_culture/views/screens/daily_routine/routine_screen.dart';
import 'package:urban_culture/views/screens/streaks_screen/steaks_screen.dart';
import 'package:urban_culture/views/utils/constants/app_colors.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  var controller = Get.put(StreakController());
  int _selectedIndex = 0;
   final List<Widget> _widgetOptions = <Widget>[
     RoutineScreen(),
    const StreaksScreen(),
  ];

  void _onItemTapped(int index) {
      controller.fetchStreakData();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: AppColors.subTitleColor,),
            label: 'Routine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded,color: AppColors.subTitleColor),
            label: 'Streaks',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.subTitleColor,
        onTap: _onItemTapped,
      ),
    );
  }
}