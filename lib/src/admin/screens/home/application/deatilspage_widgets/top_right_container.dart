import 'package:flutter/cupertino.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';

// ignore: must_be_immutable
class MainTopRightContainer extends StatelessWidget {
  MainTopRightContainer({
    required this.email,
    required this.number,
    required this.work,
    required this.experience,
   
    super.key,
  });
  String work;
  int number;
  String email;
  int experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.4,
      color: AppColors.seconderyColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Position',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Constants.spaceHight10,
            Text(
              work,
              style: const TextStyle(
                  fontSize: 15, letterSpacing: 1, color: AppColors.thirdColor),
            ),
            Constants.spaceHight20,
            const Text(
              'Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Constants.spaceHight10,
            Text(
              number.toString(),
              style: const TextStyle(
                  fontSize: 15, letterSpacing: 1, color: AppColors.thirdColor),
            ),
            Constants.spaceHight20,
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Constants.spaceHight10,
            Text(
              email,
              style: const TextStyle(
                  fontSize: 15, letterSpacing: 1, color: AppColors.thirdColor),
            ),
            Constants.spaceHight20,
            const Text(
              'Experience',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Constants.spaceHight10,
            Text(
              experience.toString(),
              style: const TextStyle(
                  fontSize: 15, letterSpacing: 0, color: AppColors.thirdColor),
            ),
          ],
        ),
      ),
    );
  }
}
