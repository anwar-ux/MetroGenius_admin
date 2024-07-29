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
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
        appBar: isLargeScreen
            ? null
            : AppBar(
                backgroundColor: AppColors.primaryColor,
                title: isLargeScreen
                    ? Row(
                        children: [
                          const Text(
                            'Admin Dashboard',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(width: 70),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.manage_search),
                                  suffixIcon: Icon(Icons.clear_rounded),
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Admin Dashboard',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.normal),
                      ),
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
                actions: isLargeScreen
                    ? []
                    : [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.manage_search_rounded))
                      ],
              ),
        body: isLargeScreen
            ? Row(
                children: [
                  if (isLargeScreen)
                    SizedBox(
                      width: 260,
                      child: Drawer(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        shadowColor: AppColors.lightGrey,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.lightBlue,
                                Color.fromARGB(102, 40, 56, 145)
                              ],
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: <Widget>[
                              Constants.spaceHight10,
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Admin dashboard',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.seconderyColor),
                                ),
                              ),
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
                              // _buildDrawerItem(
                              //   icon: Icons.analytics_outlined,
                              //   text: 'Analytics',
                              //   index: 3,
                              // ),
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
                    ),
                  Expanded(child: _children[_currentIndex]),
                ],
              )
            : _children[_currentIndex],
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
                        Color.fromARGB(102, 40, 56, 145)
                      ],
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      _buildDrawerItem(
                        icon: Icons.home_outlined,
                        text: 'Home',
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
              ));
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
          color: _currentIndex == index
              ? Colors.blue.shade200.withOpacity(0.5)
              : Colors.transparent,
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
              color:
                  _currentIndex == index ? AppColors.lightGrey : Colors.white,
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
