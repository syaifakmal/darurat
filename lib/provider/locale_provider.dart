import 'package:darurat/data/repository/language_repo.dart';
import 'package:darurat/l10n/l10n.dart';
import 'package:darurat/main.dart';
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  final LocaleRepo localRepo;

  LocaleProvider({required this.localRepo});

  Locale? get locale => _locale;
  Locale? _locale;

  Future<void> initLocale() async {
    _locale = localRepo.getLocale();
    notifyListeners();
    if (_locale != null) return;
    BuildContext context = navigatorKey.currentState!.context;
    Locale _systemLocale = Localizations.localeOf(context);
    bool contain = L10n.isContain(_systemLocale);
    if (!contain) return;
    _locale = _systemLocale;
    notifyListeners();
  }

  // Localizations.localeOf(context).toString()

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    localRepo.setLanguage(_locale!);
    notifyListeners();
  }

  void cleaLocale() {
    _locale = null;
    localRepo.clearLanguage();
    notifyListeners();
  }
}
