import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/workers/bloc/get_workers_bloc.dart';
import 'package:metrogenius_admin/src/widgets/snak_bar.dart';
import 'package:metrogenius_admin/utils/colors.dart';
import 'package:metrogenius_admin/utils/constants.dart';


class WorkersPage extends StatelessWidget {
  const WorkersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Workers'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
      body: BlocConsumer<GetWorkersBloc, GetWorkersState>(
        listener: (context, state) {
          if (state is GetWorkersFailed) {
            showCustomSnackbar(context, 'Failed', state.errorMsg, Colors.red);
          }
        },
        builder: (context, state) {
          if (state is GetWorkersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetWorkersLoaded) {
            final data = state.data;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final doc = data[index];
                 return Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      color: AppColors.seconderyColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.lightGrey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                            blurStyle:
                                BlurStyle.normal // changes position of shadow
                            ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          doc['Name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1),
                        ),
                        leading:CircleAvatar(backgroundImage:NetworkImage( doc['Image'],),radius: 30,),
                        subtitle: Text(doc['Work']),
                      ),
                    ),
                  );
                }, separatorBuilder:(context, index) => Constants.spaceHight10,
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
