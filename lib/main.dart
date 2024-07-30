import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metrogenius_admin/firebase_options.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/addcategory/category_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/addsubcategory/add_sub_category_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/getcategory/getcategory_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/category/bloc/getsubcategory/get_sub_category_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/home/admin_bottom_navigation.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/bloc/button_click/accept_reject_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/home/application/bloc/getemployeeapplication/get_employee_applications_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/workers/bloc/get_workers_bloc.dart';
import 'package:metrogenius_admin/src/admin/screens/workers/workers_page.dart';
import 'package:metrogenius_admin/src/widgets/all_services_grid.dart';
import 'package:metrogenius_admin/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => AcceptRejectBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => GetcategoryBloc()..add(FetchCategoryData()),
          child: AllServicesGrid(),
        ),
        BlocProvider(
          create: (context) => GetWorkersBloc()..add(FetchWorkersData()),
          child: WorkersPage(),
        ),
        BlocProvider(
          create: (context) => GetEmployeeApplicationsBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AddSubCategoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetSubCategoryBloc(),
        )
      ],
      child: MaterialApp(
        color: Colors.black,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: AppColors.primaryColor,
            textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        home: const AdminNavigation(),
      ),
    );
  }
}
