import 'package:flutter/material.dart';
import 'package:think_linker/main.dart';
import 'package:think_linker/static_grid.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _widgetOptions = [
    MyHomePage(),
    const Time(),
    const GridToggleScreen(),
    const Progress(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                iconSize: 20.0,
                selectedIconTheme: const IconThemeData(size: 28.0),
                selectedItemColor: const Color.fromARGB(255, 46, 90, 172),
                unselectedItemColor: Colors.black,
                selectedFontSize: 14.0,
                unselectedFontSize: 12,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,color: Colors.black),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.access_time_sharp,color: Colors.black,),
                      label: 'Time',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_circle,color: Colors.orange,size: 35,),
                      label: 'Add',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_chart_outlined,color: Colors.black),
                      label: 'Progress',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings,color: Colors.black),
                      label: 'Settings',
                    ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

