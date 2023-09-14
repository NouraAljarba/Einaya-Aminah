part of 'custom_ing_cubit.dart';

sealed class CustomIngState {}

class CustomIngInitial extends CustomIngState {}

class CustomProgresState extends CustomIngState {}

class CustomSuccessState extends CustomIngState {
  final List<Ingredient> ingList;

  CustomSuccessState({required this.ingList});
}

class CustomFailedState extends CustomIngState {
  final String error;
  CustomFailedState({required this.error});
}
