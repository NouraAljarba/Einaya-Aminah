// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Terms and Conditions`
  String get terms {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacey Policy`
  String get privacy {
    return Intl.message(
      'Privacey Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contact {
    return Intl.message(
      'Contact us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to safe care!`
  String get onBoardingPage1Headline {
    return Intl.message(
      'Welcome to safe care!',
      name: 'onBoardingPage1Headline',
      desc: '',
      args: [],
    );
  }

  /// `Dive into a world where you're in control. Understand what's in your products and make choices that resonate with your values.`
  String get onBoardingPage1Body {
    return Intl.message(
      'Dive into a world where you\'re in control. Understand what\'s in your products and make choices that resonate with your values.',
      name: 'onBoardingPage1Body',
      desc: '',
      args: [],
    );
  }

  /// `Scan. Identify. Decide`
  String get onBoardingPage2Headline {
    return Intl.message(
      'Scan. Identify. Decide',
      name: 'onBoardingPage2Headline',
      desc: '',
      args: [],
    );
  }

  /// `With our intuitive ingredient-scanning feature, instantly spot harmful components in products. Knowledge is power, and we're here to empower your choices`
  String get onBoardingPage2Body {
    return Intl.message(
      'With our intuitive ingredient-scanning feature, instantly spot harmful components in products. Knowledge is power, and we\'re here to empower your choices',
      name: 'onBoardingPage2Body',
      desc: '',
      args: [],
    );
  }

  /// `Tailor Preferences`
  String get onBoardingPage3Headline {
    return Intl.message(
      'Tailor Preferences',
      name: 'onBoardingPage3Headline',
      desc: '',
      args: [],
    );
  }

  /// `Set your standards and let us do the rest. Discover products that align with your preferences, ensuring you always make an informed decision.\n`
  String get onBoardingPage3Body {
    return Intl.message(
      'Set your standards and let us do the rest. Discover products that align with your preferences, ensuring you always make an informed decision.\n',
      name: 'onBoardingPage3Body',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `sign Up with google`
  String get signUP {
    return Intl.message(
      'sign Up with google',
      name: 'signUP',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get Preferences {
    return Intl.message(
      'Preferences',
      name: 'Preferences',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Language`
  String get language {
    return Intl.message(
      'Arabic Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
