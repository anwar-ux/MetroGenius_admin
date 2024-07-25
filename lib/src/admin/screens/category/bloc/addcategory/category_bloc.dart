
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrogenius_admin/services/admin/category/category.dart';
import 'package:random_string/random_string.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<NameChanged>(_nameChanged);
    on<ImageChanged>(_imageChanged);
    on<FormSubmit>(_formSubmit);
  }
  void _nameChanged(NameChanged event, Emitter<CategoryState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _imageChanged(ImageChanged event, Emitter<CategoryState> emit) {
    emit(state.copyWith(image: event.image));
  }

  void _formSubmit(FormSubmit event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.pending));
    try {
      final genaratedId = randomAlphaNumeric(6);
      final categoryDetails = CategoryAdmin.categoryInfo(
        id: genaratedId,
        name: state.name!,
        image: state.image!,
      );
      final result =
          await CategoryAdmin.addCategory(categoryDetails, genaratedId);
      if (result) {
        emit(state.copyWith(status: FormStatus.success));
      } else {
        emit(state.copyWith(status: FormStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error));
    }
  }
}
