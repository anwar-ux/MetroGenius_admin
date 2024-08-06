// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:metrogenius_admin/services/admin/applications/get_applications.dart';
import 'package:random_string/random_string.dart';

part 'accept_reject_event.dart';
part 'accept_reject_state.dart';

class AcceptRejectBloc extends Bloc<AcceptRejectEvent, AcceptRejectState> {
  AcceptRejectBloc() : super(const AcceptRejectState()) {
    on<AcceptClicked>(_acceptClicked);
    on<RejectClicked>(_rejectClicked);
  }

  void _acceptClicked(AcceptClicked event, Emitter<AcceptRejectState> emit) async {
    try {
      print('Event received: AcceptClicked'); // Debugging statement
      final generatedId = randomAlphaNumeric(6);
      print('Generated Employee ID: $generatedId'); // Debugging statement

      final employeeDoc = Applications.employeeAplicationInfo(event.data, generatedId);
      print('Employee Doc Created: $employeeDoc'); // Debugging statement

      final acceptStatus = await Applications.addEmployee(employeeDoc, generatedId);
      print('Employee added to Firestore: $acceptStatus'); // Debugging statement

      emit(state.copyWith(acceptStatus: FormStatus.pending));

      if (acceptStatus) {
        print('Employee added successfully.');
        emit(state.copyWith(acceptStatus: FormStatus.success));
      }
    } catch (e) {
      print('Error in _acceptClicked: $e'); // Debugging statement
      emit(state.copyWith(acceptStatus: FormStatus.error));
    }
  }

  void _rejectClicked(RejectClicked event, Emitter<AcceptRejectState> emit) async {
    emit(state.copyWith(rejectStatus: FormStatus.pending));
    try {
      final deletestatus = await Applications.deleteCategory(event.id);
      if (deletestatus) {
        emit(state.copyWith(rejectStatus: FormStatus.success));
      }
    } catch (e) {
      print('Error in _rejectClicked: $e'); // Debugging statement
      emit(state.copyWith(rejectStatus: FormStatus.error));
    }
  }
}
