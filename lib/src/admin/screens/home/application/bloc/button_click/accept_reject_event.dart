part of 'accept_reject_bloc.dart';

@immutable
sealed class AcceptRejectEvent {}

final class AcceptClicked extends AcceptRejectEvent {
   AcceptClicked(this.data);
  final DocumentSnapshot data;
}

final class RejectClicked extends AcceptRejectEvent {
   RejectClicked(this.id);
  final String id;
}
