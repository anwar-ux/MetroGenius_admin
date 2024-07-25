part of 'get_workers_bloc.dart';

sealed class GetWorkersEvent extends Equatable {
  const GetWorkersEvent();

  @override
  List<Object> get props => [];
}
class FetchWorkersData extends GetWorkersEvent {}

class DataFetched extends GetWorkersEvent {
  final List<DocumentSnapshot> data;
  const DataFetched(this.data);
  @override
  List<Object> get props => [data];
}