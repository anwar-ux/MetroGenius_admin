part of 'get_sub_category_bloc.dart';

sealed class GetSubCategoryState extends Equatable {
  const GetSubCategoryState();

  @override
  List<Object> get props => [];
}

final class GetSubCategoryInitial extends GetSubCategoryState {}

final class GetSubCategoryLoading extends GetSubCategoryState {}

final class GetSubCategoryLoaded extends GetSubCategoryState {
  final List<DocumentSnapshot> data;
 const GetSubCategoryLoaded(this.data);
}

final class GetSubCategoryFailed extends GetSubCategoryState {
   final String errorMsg;

  const GetSubCategoryFailed(this.errorMsg);
}
