part of 'results_bloc.dart';

abstract class ResultsState {}

class ResultsInitial extends ResultsState {}

class ResultsLoading extends ResultsState {}

class ResultsLoaded extends ResultsState {
  final List<String> ingredientNames;

  ResultsLoaded({required this.ingredientNames});
}

class ResultsError extends ResultsState {
  final String message;

  ResultsError({required this.message});
}
