import 'package:bloc/bloc.dart';
import 'package:einayaaminah/app/core/utilities/Shared/shared_pref/shared_data.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(darkTheme: CasheData.getData(key: 'isDark')?? false));

  changeTheme(bool isDark) async{
    CasheData.setData(key: 'isDark', value: isDark);
    emit(ThemeInitial(darkTheme: isDark));
  }
}
