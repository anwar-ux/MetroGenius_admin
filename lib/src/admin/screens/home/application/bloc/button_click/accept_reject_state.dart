part of 'accept_reject_bloc.dart';

enum FormStatus {
  initial,
  pending,
  success,
  error,
}



@immutable
class AcceptRejectState {
  const AcceptRejectState({
    this.rejectStatus = FormStatus.initial,
    this.acceptStatus=FormStatus.initial,
  });
  final FormStatus? rejectStatus;
  final FormStatus? acceptStatus;

  AcceptRejectState copyWith({
    FormStatus? rejectStatus,
    FormStatus? acceptStatus
  }) =>
      AcceptRejectState(
        rejectStatus: rejectStatus ?? this.rejectStatus,
        acceptStatus: acceptStatus??this.acceptStatus,
      );
}
