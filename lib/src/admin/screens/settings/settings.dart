import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrogenius_admin/utils/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                      blurStyle: BlurStyle.normal 
                      ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child:   ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1),
                  ),
                  trailing: Icon(Icons.logout),
                  subtitle: Text('Logout from here'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
