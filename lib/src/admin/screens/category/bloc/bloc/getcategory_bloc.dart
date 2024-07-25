import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:metrogenius_admin/services/admin/category/category.dart';

part 'getcategory_event.dart';
part 'getcategory_state.dart';

class GetcategoryBloc extends Bloc<GetcategoryEvent, GetcategoryState> {
  GetcategoryBloc() : super(GetCategoryInitial()) {
   on<FetchCategoryData>(_onFetchData);
    on<DataFetched>(_onDataFetched);
  }

  Future<void> _onFetchData(FetchCategoryData event, Emitter<GetcategoryState> emit) async {
    emit(GetCategoryLoading());
    try {
      Stream<QuerySnapshot> dataStream = await CategoryAdmin.getCategorys();
      dataStream.listen((snapshot) {final data = snapshot.docs;
      add(DataFetched(data));
      });
    } catch (e) {
      emit(GetCategoryFailed(e.toString()));
    }
  }

  void _onDataFetched(DataFetched event, Emitter<GetcategoryState> emit) {
    emit(GetCategoryLoaded(event.data));
  }
}
