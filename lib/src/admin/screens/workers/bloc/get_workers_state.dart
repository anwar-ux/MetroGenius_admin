part of 'get_workers_bloc.dart';

sealed class GetWorkersState extends Equatable {
  const GetWorkersState();
  
  @override
  List<Object> get props => [];
}

final class GetWorkersInitial extends GetWorkersState {}

final class GetWorkersLoading
    extends GetWorkersState {}

final class GetWorkersLoaded extends GetWorkersState {
  final List<DocumentSnapshot> data;

  const GetWorkersLoaded(this.data);
}

final class GetWorkersFailed extends GetWorkersState {
  final String errorMsg;

  const GetWorkersFailed(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

