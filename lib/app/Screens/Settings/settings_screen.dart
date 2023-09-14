import 'package:einayaaminah/app/Screens/Settings/Widgets/pdf_viewer.dart';
import 'package:einayaaminah/app/Screens/Settings/Widgets/privacy_policy.dart';
import 'package:einayaaminah/app/core/Bloc/locale_cubit/locale_cubit.dart';

import 'package:einayaaminah/app/core/Bloc/theme_cubit/theme_cubit.dart';
import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:einayaaminah/app/core/utilities/extention/navigator.dart';
import 'package:einayaaminah/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Card(
                elevation: 2,
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).settings,
                          style: theme.textTheme.titleLarge),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                              child: Text(S.of(context).darkTheme,
                                  style: TextStyle(
                                      fontSize:
                                          AppSizes.subHeadSize(context)))),
                          Icon(Icons.brightness_6,
                              color: theme.iconTheme.color),
                          const SizedBox(width: 10),
                          BlocBuilder<ThemeCubit, ThemeState>(
                            builder: (context, state) {
                              return Switch(
                                activeColor: theme.primaryColor,
                                value: state.darkTheme,
                                onChanged: (value) {
                                  context.read<ThemeCubit>().changeTheme(value);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).language,
                              style: TextStyle(
                                  fontSize: AppSizes.subHeadSize(context)),
                            ),
                          ),
                          Icon(Icons.language, color: theme.iconTheme.color),
                          const SizedBox(width: 10),
                          BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, localeState) {
                              return Switch(
                                activeColor: theme.primaryColor,
                                value: localeState.locale == 'ar',
                                onChanged: (value) {
                                  context
                                      .read<LocaleCubit>()
                                      .switchLocale(value ? 'ar' : 'en');
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Card(
                elevation: 2,
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).about,
                          style: theme.textTheme.titleLarge),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          const PDFScreen().push(context);
                        },
                        child: Text(S.of(context).terms,
                            style: TextStyle(
                                fontSize: AppSizes.subHeadSize(context))),
                      ),
                      const SizedBox(height: 10),
                      Divider(thickness: 1, color: theme.primaryColor),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          const Privacy().push(context);
                        },
                        child: Text(S.of(context).privacy,
                            style: TextStyle(
                                fontSize: AppSizes.subHeadSize(context))),
                      ),
                      const SizedBox(height: 10),
                      Divider(thickness: 1, color: theme.primaryColor),
                      const SizedBox(height: 15),
                      Text(S.of(context).contact,
                          style: TextStyle(
                              fontSize: AppSizes.subHeadSize(context))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
