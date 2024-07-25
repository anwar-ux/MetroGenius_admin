import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/services/admin/applications/get_applications.dart';
part 'get_employee_applications_event.dart';
part 'get_employee_applications_state.dart';

class GetEmployeeApplicationsBloc
    extends Bloc<GetEmployeeApplicationsEvent, GetEmployeeApplicationsState> {


  GetEmployeeApplicationsBloc()
      : super(GetEmployeeApplicationsInitial()) {
    on<FetchData>(_onFetchData);
    on<DataFetched>(_onDataFetched);
  }

  Future<void> _onFetchData(FetchData event, Emitter<GetEmployeeApplicationsState> emit) async {
    emit(GetEmployeeApplicationsLoading());
    try {
      Stream<QuerySnapshot> dataStream = await Applications.getEmployeeApplicatons();
      dataStream.listen((snapshot) {
        final data = snapshot.docs;
        add(DataFetched(data));
      });
    } catch (e) {
      emit(GetEmployeeApplicationsFailed(e.toString()));
    }
  }

  void _onDataFetched(DataFetched event, Emitter<GetEmployeeApplicationsState> emit) {
    emit(GetEmployeeApplicationsLoaded(event.data));
  }
}