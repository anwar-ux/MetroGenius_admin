part of 'get_employee_applications_bloc.dart';

sealed class GetEmployeeApplicationsEvent extends Equatable {
  const GetEmployeeApplicationsEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends GetEmployeeApplicationsEvent {}

class DataFetched extends GetEmployeeApplicationsEvent {
  final List<DocumentSnapshot> data;
  const DataFetched(this.data);
  @override
  List<Object> get props => [data];
}
