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

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Comic`
  String get sSplashScreenComic {
    return Intl.message(
      'Comic',
      name: 'sSplashScreenComic',
      desc: '',
      args: [],
    );
  }

  /// `Magazine`
  String get sSplashScreenMagazine {
    return Intl.message(
      'Magazine',
      name: 'sSplashScreenMagazine',
      desc: '',
      args: [],
    );
  }

  /// `Trade paperback`
  String get sSplashScreenTradePaperback {
    return Intl.message(
      'Trade paperback',
      name: 'sSplashScreenTradePaperback',
      desc: '',
      args: [],
    );
  }

  /// `Hardcover`
  String get sSplashScreenHardcover {
    return Intl.message(
      'Hardcover',
      name: 'sSplashScreenHardcover',
      desc: '',
      args: [],
    );
  }

  /// `Digest`
  String get sSplashScreenDigest {
    return Intl.message(
      'Digest',
      name: 'sSplashScreenDigest',
      desc: '',
      args: [],
    );
  }

  /// `Graphic novel`
  String get sSplashScreenGraphicNovel {
    return Intl.message(
      'Graphic novel',
      name: 'sSplashScreenGraphicNovel',
      desc: '',
      args: [],
    );
  }

  /// `Digital comic`
  String get sSplashScreenDigitalComic {
    return Intl.message(
      'Digital comic',
      name: 'sSplashScreenDigitalComic',
      desc: '',
      args: [],
    );
  }

  /// `Infinite comic`
  String get sSplashScreenInfiniteComic {
    return Intl.message(
      'Infinite comic',
      name: 'sSplashScreenInfiniteComic',
      desc: '',
      args: [],
    );
  }

  /// `You can find`
  String get sPlashScreenStaticText {
    return Intl.message(
      'You can find',
      name: 'sPlashScreenStaticText',
      desc: '',
      args: [],
    );
  }

  /// `Filtrar por:`
  String get sHomehScreenFilterBy {
    return Intl.message(
      'Filtrar por:',
      name: 'sHomehScreenFilterBy',
      desc: '',
      args: [],
    );
  }

  /// `Marvel App`
  String get sHomehScreenTitle {
    return Intl.message(
      'Marvel App',
      name: 'sHomehScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `No hay información disposible`
  String get sHomehScreenNoInformationAvailable {
    return Intl.message(
      'No hay información disposible',
      name: 'sHomehScreenNoInformationAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Este comic no tiene una descripción`
  String get sDescriptionScreenNoDescription {
    return Intl.message(
      'Este comic no tiene una descripción',
      name: 'sDescriptionScreenNoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Valor en impreso`
  String get sDescriptionScreenPrintPrice {
    return Intl.message(
      'Valor en impreso',
      name: 'sDescriptionScreenPrintPrice',
      desc: '',
      args: [],
    );
  }

  /// `Valor en digital`
  String get sDescriptionScreenDigitalPurchasePrice {
    return Intl.message(
      'Valor en digital',
      name: 'sDescriptionScreenDigitalPurchasePrice',
      desc: '',
      args: [],
    );
  }

  /// `Útlima actualizacion: {to}`
  String sDescriptionScreenLastUpdateDate(Object to) {
    return Intl.message(
      'Útlima actualizacion: $to',
      name: 'sDescriptionScreenLastUpdateDate',
      desc: '',
      args: [to],
    );
  }

  /// `Descripción`
  String get sDescriptionScreenDescription {
    return Intl.message(
      'Descripción',
      name: 'sDescriptionScreenDescription',
      desc: '',
      args: [],
    );
  }

  /// `Historias`
  String get sDescriptionScreenComicStories {
    return Intl.message(
      'Historias',
      name: 'sDescriptionScreenComicStories',
      desc: '',
      args: [],
    );
  }

  /// `Creadores`
  String get sDescriptionScreenComicCreators {
    return Intl.message(
      'Creadores',
      name: 'sDescriptionScreenComicCreators',
      desc: '',
      args: [],
    );
  }

  /// `Estos son los cómics en los cuales ha colaborado este autor:`
  String get sCreatorDescriptionScreenInfo {
    return Intl.message(
      'Estos son los cómics en los cuales ha colaborado este autor:',
      name: 'sCreatorDescriptionScreenInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
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
