import 'package:flutter/material.dart';
import 'package:social_design_system/social_design_system.dart';

class ComicNavigationRialScreen extends StatefulWidget {
  static const String routeName = '/Navigation_rail_screen';
  const ComicNavigationRialScreen({super.key});

  @override
  State<ComicNavigationRialScreen> createState() =>
      _ComicNavigationRialScreenState();
}

class _ComicNavigationRialScreenState extends State<ComicNavigationRialScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ComicTheme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comic Navigation Rail'),
        ),
        body: Row(
          children: [
            NavigationRail(
              onDestinationSelected: _onItemTapped,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.message),
                  label: Text('Chat'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
              selectedIndex: selectedIndex,
            ),
            const VerticalDivider()
          ],
        ),
      ),
    );
  }
}
