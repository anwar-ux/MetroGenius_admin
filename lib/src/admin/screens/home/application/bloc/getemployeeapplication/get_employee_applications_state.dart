part of 'get_employee_applications_bloc.dart';

sealed class GetEmployeeApplicationsState extends Equatable {
  const GetEmployeeApplicationsState();

  @override
  List<Object> get props => [];
}

final class GetEmployeeApplicationsInitial
    extends GetEmployeeApplicationsState {}

final class GetEmployeeApplicationsLoading
    extends GetEmployeeApplicationsState {}

final class GetEmployeeApplicationsLoaded extends GetEmployeeApplicationsState {
  final List<DocumentSnapshot> data;

  const GetEmployeeApplicationsLoaded(this.data);
}

final class GetEmployeeApplicationsFailed extends GetEmployeeApplicationsState {
  final String errorMsg;

  const GetEmployeeApplicationsFailed(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

