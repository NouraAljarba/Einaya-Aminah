import 'package:einayaaminah/app/core/Bloc/cubit/custom_ing_cubit.dart';
import 'package:einayaaminah/app/core/Bloc/database_bloc/database_bloc.dart';
import 'package:einayaaminah/app/core/Bloc/locale_cubit/locale_cubit.dart';
import 'package:einayaaminah/app/core/Bloc/perferance_bloc/perferance_bloc.dart';
import 'package:einayaaminah/app/core/Bloc/theme_cubit/theme_cubit.dart';
import 'package:einayaaminah/app/core/utilities/Constants/links.dart';
import 'package:einayaaminah/app/core/utilities/Shared/shared_pref/shared_data.dart';
import 'package:einayaaminah/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/Screens/Splash/splash_screen.dart';
import 'app/core/Bloc/authentication_bloc/authentication_bloc.dart';
import 'app/core/Bloc/results_bloc/results_bloc.dart';
import 'app/core/utilities/Constants/theme/theme_constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheData.intialise();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
    authCallbackUrlHostname: hostName,
    debug: true,
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider<PreferenceBloc>(
          create: (context) => PreferenceBloc(),
        ),
        BlocProvider<DatabaseBloc>(
          create: (context) => DatabaseBloc(),
        ),
        BlocProvider<ResultsBloc>(
          create: (context) => ResultsBloc(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit(),
        ),
        BlocProvider<CustomIngCubit>(
          create: (context) => CustomIngCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                locale: Locale(localeState.locale),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                theme: appThemes(context, themeState.darkTheme),
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
