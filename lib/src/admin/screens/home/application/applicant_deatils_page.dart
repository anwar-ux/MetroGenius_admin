import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/applications_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/bloc/button_click/accept_reject_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/deatilspage_widgets/top_left_container.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/deatilspage_widgets/top_right_container.dart';
import 'package:metrogenius_admin/src/admin/screens/home/home.dart';
import 'package:metrogenius_admin/src/widgets/alertdialog_custom.dart';
import 'package:metrogenius_admin/src/widgets/snak_bar.dart';

class ApplicantDeatilsPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const ApplicantDeatilsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AcceptRejectBloc, AcceptRejectState>(
      listener: (context, state) {
        if (state.acceptStatus == FormStatus.success) {
          showCustomSnackbar(
              context, 'Success', 'Employee added successfully', Colors.green);
        }
        if (state.acceptStatus == FormStatus.error) {
          showCustomSnackbar(
              context, 'Error', 'Error adding employee', Colors.red);
        }
        if (state.rejectStatus == FormStatus.success) {
          showCustomSnackbar(
              context, 'Deleted', 'Deletion successful', Colors.green);
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Row(
                children: [
                  MainTopLeftContainer(
                    idProof: data['IDproof'],
                    image: data['Image'],
                    name: data['Name'],
                    delete: () {
                      alertDialogCustom(
                        firstButtonText: 'Cancel',
                        secondButtonText: 'Delete',
                        firstButtonAction: () => Navigator.pop(context),
                        secondButtonAction: () {
                          Navigator.pop(context);
                          showCustomSnackbar(
                              context, 'Please wait', 'Deleting employee...', Colors.blue);
                          context
                              .read<AcceptRejectBloc>()
                              .add(RejectClicked(data['Id']));
                          Navigator.of(context).pushReplacement(
                              createRoute(const ApplicationsPage()));
                        },
                        context: context,
                        title: 'Delete',
                        message: 'Are you sure about deleting this?',
                      );
                    },
                    accept: () {
                      alertDialogCustom(
                        firstButtonText: 'Cancel',
                        secondButtonText: 'Add',
                        firstButtonAction: () => Navigator.pop(context),
                        secondButtonAction: () {
                          Navigator.pop(context);
                          showCustomSnackbar(
                              context, 'Employee aded', 'Adde', Colors.blue);
                          context
                              .read<AcceptRejectBloc>()
                              .add(AcceptClicked(data));
                          Navigator.of(context).pushReplacement(
                              createRoute(const AdminHome()));
                        },
                        context: context,
                        title: 'Add to Workers',
                        message: 'Are you sure about adding this worker?',
                      );
                    },
                  ),
                  MainTopRightContainer(
                    email: data['Email'],
                    number: data['Phone'],
                    work: data['Work'],
                    experience: data['Experience'],
                  )
                ],
              ),
              // Row(
              //   children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height * 0.5,
              //       width: MediaQuery.of(context).size.width * 0.9,
              //       color: AppColors.thirdColor,
              //     ),
              //     Container(
              //       height: MediaQuery.of(context).size.height * 0.5,
              //       width: MediaQuery.of(context).size.width * 0.1,
              //       color: AppColors.seconderyColor,
              //     ),
              //   ],
              // )
            ],
          ),
        );
      },
    );
  }
}
