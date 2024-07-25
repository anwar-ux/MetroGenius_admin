part of 'getcategory_bloc.dart';

sealed class GetcategoryState extends Equatable {
  const GetcategoryState();

  @override
  List<Object> get props => [];
}

final class GetCategoryInitial
    extends GetcategoryState {}

final class GetCategoryLoading
    extends GetcategoryState {}

final class GetCategoryLoaded extends GetcategoryState {
  final List<DocumentSnapshot> data;

  const GetCategoryLoaded(this.data);
}

final class GetCategoryFailed extends GetcategoryState {
  final String errorMsg;

  const GetCategoryFailed(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
