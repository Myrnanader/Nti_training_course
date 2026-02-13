import 'package:flutter/material.dart';
import 'package:news_app/fearures/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:news_app/fearures/home/presentation/widgets/home_body.dart';
import 'package:news_app/fearures/explore/presentation/widgets/explore_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeBody(),
    ExploreBody(),
    Scaffold(body: Center(child: Text("Search"))),
    Scaffold(body: Center(child: Text("Profile"))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: CustomeBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
