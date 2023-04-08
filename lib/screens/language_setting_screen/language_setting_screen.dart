import 'package:darurat/data/model/model.dart';
import 'package:darurat/l10n/l10n.dart';
import 'package:darurat/provider/provider.dart';
import 'package:darurat/screens/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  late LocaleProvider _localeProvider;

  List<Language> _languages = [];

  late Locale _locale;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    _localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    _locale = _localeProvider.locale!;
  }

  @override
  Widget build(BuildContext context) {
    _languages = [
      Language(title: AppLocalizations.of(context)!.english, locale: L10n.all[0]),
      Language(title: AppLocalizations.of(context)!.indonesia, locale: L10n.all[1]),
    ];
    return Scaffold(
      appBar: AppAppBar(
        title: AppLocalizations.of(context)!.languageSettingTitle,
        trailing: AppBarIcon(
          Images.iconSubmit,
          onTap: () {
            _localeProvider.setLocale(_locale);
            Navigator.of(context).pop();
          },
          tooltip: AppLocalizations.of(context)!.save,
          color: blue,
          leftPadding: 8,
          rightPadding: 16,
        ),
      ),
      body: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return ListView.builder(
            itemCount: _languages.length,
            primary: false,
            itemBuilder: (context, index) {
              return AppCard(
                onTap: () {
                  setState(() {
                    _locale = _languages[index].locale;
                  });
                },
                leading: SizedBox(
                  width: 34,
                  child: Image.asset(
                    L10n.getFlag(_languages[index].locale.languageCode),
                  ),
                ),
                title: _languages[index].title,
                trailing: AppRadioButton<Locale>(
                  value: _languages[index].locale,
                  groupValue: _locale,
                  onChanged: (value) {
                    setState(() {
                      _locale = value;
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
