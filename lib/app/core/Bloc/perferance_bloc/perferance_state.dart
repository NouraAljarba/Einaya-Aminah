part of 'perferance_bloc.dart';

abstract class PreferenceState {}

class PreferenceInitial extends PreferenceState {}

class PreferenceLoading extends PreferenceState {}

class GetPrefSucceededState extends PreferenceState {
  final Preference prefObj;

  GetPrefSucceededState({required this.prefObj});
}

class GetPrefFailedState extends PreferenceState {
  final String error;

  GetPrefFailedState({required this.error});
}

class PreferenceUpdated extends PreferenceState {}
