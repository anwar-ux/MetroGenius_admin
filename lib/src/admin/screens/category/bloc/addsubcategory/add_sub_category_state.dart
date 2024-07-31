part of 'add_sub_category_bloc.dart';

enum FormStatus { initial, success, error }

class AddSubCategoryState extends Equatable {
  final String? name;
  final int? price;
  final String? image;
  final String? discription;
  final Map<String, bool> checkboxes;
  final FormStatus status;

  const AddSubCategoryState({
    this.name,
    this.price,
    this.image,
    this.discription,
    this.checkboxes = const {},
    this.status = FormStatus.initial,
  });

  AddSubCategoryState copyWith({
    String? name,
    int? price,
    String? image,
    String? discription,
    Map<String, bool>? checkboxes,
    FormStatus? status,
  }) {
    return AddSubCategoryState(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      discription: discription ?? this.discription,
      checkboxes: checkboxes ?? this.checkboxes,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [name, price, image, discription, checkboxes, status];
}
