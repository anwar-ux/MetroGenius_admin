part of 'category_bloc.dart';

sealed class CategoryEvent {}

final class ImageChanged extends CategoryEvent {
   ImageChanged(this.image);
  String image;
}
final class NameChanged extends CategoryEvent {
   NameChanged(this.name);
  String name;
}
final class FormSubmit extends CategoryEvent {}