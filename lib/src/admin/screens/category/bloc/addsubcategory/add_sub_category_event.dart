part of 'add_sub_category_bloc.dart';

sealed class AddSubCategoryEvent {}

final class ImageChanged extends AddSubCategoryEvent {
  ImageChanged(this.image);
  String image;
}

final class NameChanged extends AddSubCategoryEvent {
  NameChanged(this.name);
  String name;
}

final class PriceChanged extends AddSubCategoryEvent {
  PriceChanged(this.price);
  int price;
}

final class DiscriptionChanged extends AddSubCategoryEvent {
  DiscriptionChanged(this.discription);
  String discription;
}

final class FormSubmit extends AddSubCategoryEvent {
  FormSubmit(this.categoryId);
  String categoryId;
}
