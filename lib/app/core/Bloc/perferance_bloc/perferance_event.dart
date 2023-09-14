part of 'perferance_bloc.dart';
abstract class PreferenceEvent {}

class GetPrefEvent extends PreferenceEvent {
  final int categoryId;

  GetPrefEvent({required this.categoryId});
}

class ChangePrefEvent extends PreferenceEvent {
  final String userId;
  final bool isIncluded;
  final int categoryId;

  ChangePrefEvent({
    required this.userId,
    required this.isIncluded,
    required this.categoryId,
  });
}
