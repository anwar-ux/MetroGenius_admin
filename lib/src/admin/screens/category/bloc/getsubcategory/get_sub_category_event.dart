part of 'get_sub_category_bloc.dart';

sealed class GetSubCategoryEvent extends Equatable {
  const GetSubCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchSubCategoryData extends GetSubCategoryEvent {
  final String categoryId;
  const FetchSubCategoryData(this.categoryId);
}

class DataFetched extends GetSubCategoryEvent {
  final List<DocumentSnapshot> data;
  const DataFetched(this.data);
  @override
  List<Object> get props => [data];
}
