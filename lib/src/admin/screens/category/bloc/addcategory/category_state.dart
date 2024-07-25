part of 'category_bloc.dart';

enum FormStatus {
  initial,
  pending,
  success,
  error,
}

@immutable
class CategoryState {
  const CategoryState({
    this.image = '',
    this.name = '',
    this.status = FormStatus.initial,
  });

  final String? name;
  final String? image;
  final FormStatus status;

  CategoryState copyWith({String? image, String? name, FormStatus? status,}) =>
      CategoryState(
        image: image ?? this.image,
        name: name ?? this.name,
        status: status??this.status
      );
}
