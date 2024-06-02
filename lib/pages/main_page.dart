import 'package:cpd_project/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/home_navigation_bar_model.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNavigationBarModel>(
      builder: (context, value, child) => Scaffold(
        body: [
          const HomePage(),
          const HistoryPage(),
        ][value.currentPageIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.view_day), label: 'History'),
          ],
          selectedIndex: value.currentPageIndex,
          onDestinationSelected: (index) {
            value.currentPageIndex = index;
          },
          indicatorColor: Colors.blue[100],
        ),
      ),
    );
  }
}
