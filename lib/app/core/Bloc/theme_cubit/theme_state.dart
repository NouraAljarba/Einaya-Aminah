part of 'theme_cubit.dart';

abstract class ThemeState {
  final bool darkTheme;

  ThemeState({required this.darkTheme});

  
}

final class ThemeInitial extends ThemeState {
  ThemeInitial({required super.darkTheme});
}