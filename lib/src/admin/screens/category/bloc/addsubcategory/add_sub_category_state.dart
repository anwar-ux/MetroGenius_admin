part of 'add_sub_category_bloc.dart';

enum FormStatus {
  initial,
  pending,
  success,
  error,
}

@immutable
class AddSubCategoryState {
  const AddSubCategoryState({
    this.image = '',
    this.name = '',
    this.price = 0,
    this.discription = '',
    this.status = FormStatus.initial,
  });

  final String? name;
  final String? image;
  final int? price;
  final String? discription;
  final FormStatus status;

  AddSubCategoryState copyWith({
    String? image,
    String? name,
    FormStatus? status,
    int? price,
    String? discription,
  }) =>
      AddSubCategoryState(
        image: image ?? this.image,
        name: name ?? this.name,
        status: status ?? this.status,
        price: price??this.price,
        discription: discription??this.discription
      );
}
