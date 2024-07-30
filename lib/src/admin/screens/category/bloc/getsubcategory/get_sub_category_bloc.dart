import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:metrogenius_admin/services/admin/category/subcategory.dart';

part 'get_sub_category_event.dart';
part 'get_sub_category_state.dart';

class GetSubCategoryBloc extends Bloc<GetSubCategoryEvent, GetSubCategoryState> {
  GetSubCategoryBloc() : super(GetSubCategoryInitial()) {
    on<FetchSubCategoryData>(_fetchSubCategoryData);
    on<DataFetched>(_dataFetched);
  }

 void _fetchSubCategoryData(FetchSubCategoryData event, Emitter<GetSubCategoryState> emit) async {
  emit(GetSubCategoryLoading());
  try {
    Stream<QuerySnapshot> dataStream = await Subcategory.getSubcategories(event.categoryId);
    await emit.forEach<QuerySnapshot>(
      dataStream,
      onData: (snapshot) {
        final data = snapshot.docs;
        return GetSubCategoryLoaded(data);
      },
      onError: (error, stackTrace) {
        return GetSubCategoryFailed(error.toString());
      },
    );
  } catch (e) {
    emit(GetSubCategoryFailed(e.toString()));
  }
}


  void _dataFetched(DataFetched event, Emitter<GetSubCategoryState> emit) {
    emit(GetSubCategoryLoaded(event.data));
  }
}
