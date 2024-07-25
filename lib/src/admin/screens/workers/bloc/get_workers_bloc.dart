import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:metrogenius_admin/services/admin/workers/workers.dart';

part 'get_workers_event.dart';
part 'get_workers_state.dart';

class GetWorkersBloc extends Bloc<GetWorkersEvent, GetWorkersState> {
  GetWorkersBloc() : super(GetWorkersInitial()) {
  on<FetchWorkersData>(_onFetchData);
    on<DataFetched>(_onDataFetched);
  }

  Future<void> _onFetchData(FetchWorkersData event, Emitter<GetWorkersState> emit) async {
    emit(GetWorkersLoading());
    try {
      Stream<QuerySnapshot> dataStream = await Workers.getWorkers();
      dataStream.listen((snapshot) {
        final data = snapshot.docs;
        add(DataFetched(data));
      });
    } catch (e) {
      emit(GetWorkersFailed(e.toString()));
    }
  }

  void _onDataFetched(DataFetched event, Emitter<GetWorkersState> emit) {
    emit(GetWorkersLoaded(event.data));
  }
}
