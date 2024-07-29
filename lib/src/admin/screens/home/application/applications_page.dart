import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/animation/route_animation.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/applicant_deatils_page.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/bloc/getemployeeapplication/get_employee_applications_bloc.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEmployeeApplicationsBloc()..add(FetchData()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Applications'),
    
        ),
        body: BlocConsumer<GetEmployeeApplicationsBloc,
            GetEmployeeApplicationsState>(
          listener: (context, state) {
            if (state is GetEmployeeApplicationsFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.errorMsg}')),
              );
            }
          },
          builder: (context, state) {
            if (state is GetEmployeeApplicationsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetEmployeeApplicationsLoaded) {
              final data = state.data;
              if (data.isEmpty) {
                return const Center(
                  child: Text(
                    'There are no applications.',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final doc = data[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 10, top: 5),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(doc['Image']),
                      onBackgroundImageError: (exception, stackTrace) {
                        print('Error loading image: $exception');
                      },
                    ),
                    title: Text(doc['Name']),
                    subtitle: Text(doc['Work']),
                    onTap: () {
                      Navigator.of(context).push(
                        createRoute(
                          ApplicantDeatilsPage(
                            data: doc,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(
              child: Text('There are no applications.'),
            );
          },
        ),
      ),
    );
  }
}
