import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:metrogenius_admin/src/admin/screens/category/category_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/applications_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/home.dart';
import 'package:metrogenius_admin/src/admin/screens/settings/settings.dart';
import 'package:metrogenius_admin/src/admin/screens/workers/workers_page.dart';
import 'package:metrogenius_admin/utils/colors.dart';

class AdminNavigation extends StatefulWidget {
  const AdminNavigation({super.key});

  @override
  _AdminNavigationState createState() => _AdminNavigationState();
}

class _AdminNavigationState extends State<AdminNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const AdminHome(),
    const CategoryPage(),
    const WorkersPage(),
    const ApplicationsPage(),
    const Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.thirdColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Admin Dashboard'),
        leading: isLargeScreen
            ? null
            : Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
      ),
      body: isLargeScreen
          ? Row(
              children: [
                if (isLargeScreen)
                  SizedBox(
                    width: 260,
                    child: Drawer(
                      backgroundColor: AppColors
                          .thirdColor, // Change background color to black
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          _buildDrawerItem(
                            icon: Icons.home,
                            text: 'Home',
                            index: 0,
                          ),
                          _buildDrawerItem(
                            icon: Icons.explore_outlined,
                            text: 'Category',
                            index: 1,
                          ),
                          _buildDrawerItem(
                            icon: Icons.work,
                            text: 'Workers',
                            index: 2,
                          ),
                          _buildDrawerItem(
                            icon: Icons.library_books_outlined,
                            text: 'aplications',
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
                Expanded(child: _children[_currentIndex]),
              ],
            )
          : _children[_currentIndex],
      drawer: isLargeScreen
          ? null
          : Drawer(
              backgroundColor: Colors.black, // Change background color to black
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Home',
                    index: 0,
                  ),
                  _buildDrawerItem(
                    icon: Icons.category,
                    text: 'Category',
                    index: 1,
                  ),
                  _buildDrawerItem(
                    icon: Icons.work,
                    text: 'Workers',
                    index: 2,
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    index: 3,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required int index,
  }) {
    return ListTile(
      selectedTileColor: AppColors.thirdColor.withOpacity(0.5),
      selectedColor: AppColors.thirdColor.withOpacity(0.5),
      leading: Icon(
        icon,
        color: _currentIndex == index ?  const Color.fromARGB(255, 139, 227, 142) : Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _currentIndex == index ?  Color.fromARGB(255, 139, 227, 142) : Colors.white,
        ),
      ),
      onTap: () {
        onTabTapped(index);
        if (MediaQuery.of(context).size.width < 600) {
          Navigator.of(context).pop(); // Close the drawer
        }
      },
    );
  }
}
