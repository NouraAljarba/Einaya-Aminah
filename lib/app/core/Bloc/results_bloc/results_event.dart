part of 'results_bloc.dart';

abstract class ResultsEvent {}

class FetchIngredientsEvent extends ResultsEvent {
  final String userId;

  FetchIngredientsEvent({required this.userId});
}
