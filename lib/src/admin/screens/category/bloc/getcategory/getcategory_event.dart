part of 'getcategory_bloc.dart';

sealed class GetcategoryEvent extends Equatable {
  const GetcategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoryData extends GetcategoryEvent {}

class DataFetched extends GetcategoryEvent {
  final List<DocumentSnapshot> data;
  const DataFetched(this.data);
  @override
  List<Object> get props => [data];
}