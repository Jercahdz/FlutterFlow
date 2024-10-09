import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    't0gafcy8': {
      'es': 'Pagina 1',
      'en': 'Page 1',
    },
    'b5w192n7': {
      'es': 'Ir a Pagina 2',
      'en': 'Go to Page 2',
    },
    'zcx4sxd8': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Pagina_2
  {
    'qmernc3r': {
      'es': 'Hola Mundo',
      'en': 'Hello Word',
    },
    'qypp74j7': {
      'es': 'Lorem Ipsum',
      'en': 'Lorem Ipsum',
    },
    '2jocwiy2': {
      'es': 'Volver',
      'en': 'Go Back',
    },
    'mfh0kxcc': {
      'es': 'Pagina 2',
      'en': 'Page 2',
    },
    'xjdqm1zd': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'unl6fcx1': {
      'es': '',
      'en': '',
    },
    '4jj3krsv': {
      'es': '',
      'en': '',
    },
    'tpw1qzxk': {
      'es': '',
      'en': '',
    },
    'mkuxsmt9': {
      'es': '',
      'en': '',
    },
    'ad2ktpuf': {
      'es': '',
      'en': '',
    },
    'z94niadp': {
      'es': '',
      'en': '',
    },
    'cun2kbgp': {
      'es': '',
      'en': '',
    },
    '0yaekad6': {
      'es': '',
      'en': '',
    },
    'fy1w0e17': {
      'es': '',
      'en': '',
    },
    'uts6biqm': {
      'es': '',
      'en': '',
    },
    '6yakpudu': {
      'es': '',
      'en': '',
    },
    'egzxr47m': {
      'es': '',
      'en': '',
    },
    '4nt3bd2n': {
      'es': '',
      'en': '',
    },
    'emkw4bqv': {
      'es': '',
      'en': '',
    },
    '0o2ckpe1': {
      'es': '',
      'en': '',
    },
    'vfs6aiv1': {
      'es': '',
      'en': '',
    },
    '42hfdf15': {
      'es': '',
      'en': '',
    },
    'jv55plir': {
      'es': '',
      'en': '',
    },
    'a3vkxxal': {
      'es': '',
      'en': '',
    },
    'nkzzvznq': {
      'es': '',
      'en': '',
    },
    'oni1x7ws': {
      'es': '',
      'en': '',
    },
    'i7puswlw': {
      'es': '',
      'en': '',
    },
    'ggnb4dl5': {
      'es': '',
      'en': '',
    },
    'enwgwa0k': {
      'es': '',
      'en': '',
    },
    '35w00ids': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
