import 'package:flutter/material.dart';
import 'package:metrogenius_admin/src/admin/screens/category/category_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/applications_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/home.dart';
import 'package:metrogenius_admin/src/admin/screens/settings/settings.dart';
import 'package:metrogenius_admin/src/admin/screens/workers/workers_page.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';

class AdminNavigation extends StatefulWidget {
  const AdminNavigation({super.key});

  @override
  _AdminNavigationState createState() => _AdminNavigationState();
}

class _AdminNavigationState extends State<AdminNavigation> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _children = [
    const AdminHome(),
    const CategoryPage(),
    WorkersPage(),
    const ApplicationsPage(),
    const Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _navigatorKey.currentState!.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => _children[index],
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      appBar: isLargeScreen
          ? null
          : AppBar(
              backgroundColor: AppColors.primaryColor,
              title: const Text(
                'Admin Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.manage_search_rounded),
                ),
              ],
            ),
      body: isLargeScreen
          ? Row(
              children: [
                Drawer(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlue,
                          Color.fromARGB(102, 40, 56, 145),
                        ],
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        _buildDrawerHeader(),
                        Constants.spaceHight20,
                        _buildDrawerItem(
                          icon: Icons.home_outlined,
                          text: 'Dashboard',
                          index: 0,
                        ),
                        _buildDrawerItem(
                          icon: Icons.explore_outlined,
                          text: 'Category',
                          index: 1,
                        ),
                        _buildDrawerItem(
                          icon: Icons.work_outline,
                          text: 'Workers',
                          index: 2,
                        ),
                        _buildDrawerItem(
                          icon: Icons.library_books_outlined,
                          text: 'Applications',
                          index: 3,
                        ),
                        _buildDrawerItem(
                          icon: Icons.settings,
                          text: 'Settings',
                          index: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Navigator(
                    key: _navigatorKey,
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (context) => _children[_currentIndex],
                      );
                    },
                  ),
                ),
              ],
            )
          : Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => _children[_currentIndex],
                );
              },
            ),
      drawer: isLargeScreen
          ? null
          : Drawer(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.lightBlue,
                      Color.fromARGB(102, 40, 56, 145),
                    ],
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerHeader(),
                    _buildDrawerItem(
                      icon: Icons.home_outlined,
                      text: 'Dashboard',
                      index: 0,
                    ),
                    _buildDrawerItem(
                      icon: Icons.explore_outlined,
                      text: 'Category',
                      index: 1,
                    ),
                    _buildDrawerItem(
                      icon: Icons.work_outline,
                      text: 'Workers',
                      index: 2,
                    ),
                    _buildDrawerItem(
                      icon: Icons.library_books_outlined,
                      text: 'Applications',
                      index: 3,
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildDrawerHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        decoration: BoxDecoration(
          gradient: _currentIndex == index
              ? const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(67, 255, 255, 255),
                    Colors.transparent,
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(14),
          color: _currentIndex == index ? Colors.blue.shade200.withOpacity(0.5) : Colors.transparent,
        ),
        child: ListTile(
          selectedTileColor: AppColors.thirdColor.withOpacity(0.5),
          selectedColor: AppColors.thirdColor.withOpacity(0.5),
          leading: Icon(
            icon,
            color: _currentIndex == index ? AppColors.lightGrey : Colors.white,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: _currentIndex == index ? AppColors.lightGrey : Colors.white,
            ),
          ),
          onTap: () {
            onTabTapped(index);
            if (MediaQuery.of(context).size.width < 600) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
