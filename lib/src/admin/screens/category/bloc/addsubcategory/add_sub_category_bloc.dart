import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:metrogenius_admin/services/admin/category/subcategory.dart';
import 'package:random_string/random_string.dart';

part 'add_sub_category_event.dart';
part 'add_sub_category_state.dart';

class AddSubCategoryBloc extends Bloc<AddSubCategoryEvent, AddSubCategoryState> {
  AddSubCategoryBloc() : super(AddSubCategoryState()) {
    on<NameChanged>(_nameChanged);
    on<PriceChanged>(_priceChanged);
    on<ImageChanged>(_imageChanged);
    on<DiscriptionChanged>(_discriptionChanged);
    on<FormSubmit>(_formSubmit);
    on<CheckboxChanged>(_checkboxChanged);
  }

  void _nameChanged(NameChanged event, Emitter<AddSubCategoryState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _priceChanged(PriceChanged event, Emitter<AddSubCategoryState> emit) {
    emit(state.copyWith(price: event.price));
  }

  void _imageChanged(ImageChanged event, Emitter<AddSubCategoryState> emit) {
    emit(state.copyWith(image: event.image));
  }

  void _discriptionChanged(DiscriptionChanged event, Emitter<AddSubCategoryState> emit) {
    emit(state.copyWith(discription: event.discription));
  }

  void _checkboxChanged(CheckboxChanged event, Emitter<AddSubCategoryState> emit) {
    final updatedCheckboxes = Map<String, bool>.from(state.checkboxes)
      ..[event.checkboxName] = event.isChecked;
    emit(state.copyWith(checkboxes: updatedCheckboxes));
  }

  void _formSubmit(FormSubmit event, Emitter<AddSubCategoryState> emit) async {
    emit(state.copyWith(status: FormStatus.initial));
    try {
      final generatedId = randomAlphaNumeric(6);
      final subCategoryDetails = Subcategory.subCategoryInfo(
        id: generatedId,
        name: state.name!,
        image: state.image!,
        discription: state.discription!,
        price: state.price!,
        checkboxes: state.checkboxes,
      );
      final result = await Subcategory.addSubcategory(event.categoryId, subCategoryDetails, generatedId);
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
