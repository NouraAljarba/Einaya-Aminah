import 'package:bloc/bloc.dart';
part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(locale: 'en'));

  void switchLocale(String locale) {
    emit(LocaleState(locale: locale));
  }
}
