import 'package:flutter/material.dart';
import 'package:kabadi/screens/explore_page.dart';
import 'package:kabadi/screens/kabadi_league.dart';
import 'package:kabadi/screens/live_score_page.dart';
import 'package:kabadi/screens/points_board.dart';
import 'package:kabadi/screens/teams.dart';
import 'package:kabadi/screens/trending_page.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Trending(),
            const ExplorePage(),
            const LiveScore(),
            const PointsTablePage(),
            const Teams(),
            const KabadiLeaguePage(),
          ],
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
              bottom: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
              backgroundColor: Colors.black.withOpacity(0.5),
              selectedItemColor: Colors.white,
              selectedLabelStyle: const TextStyle(height: 0),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_kabaddi),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.scoreboard_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
