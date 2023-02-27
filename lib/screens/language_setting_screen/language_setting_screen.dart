import 'package:darurat/data/model/language.dart';
import 'package:darurat/l10n/l10n.dart';
import 'package:darurat/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:darurat/screens/widgets/app_bar_icon.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  List<Language> _language = [];

  @override
  Widget build(BuildContext context) {
    _language = [
      Language(title: AppLocalizations.of(context)!.english, locale: L10n.all[0]),
      Language(title: AppLocalizations.of(context)!.indonesia, locale: L10n.all[1]),
    ];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarIcon(
                Images.iconClose,
                onTap: () => Navigator.of(context).pop(),
                tooltip: 'Back',
                leftPadding: 16,
                rightPadding: 8,
              ),
              Text(AppLocalizations.of(context)!.languageSettingTitle, style: Poppins.medium.copyWith(fontSize: 18))
            ],
          ),
        ),
        body: Consumer<LocaleProvider>(builder: (context, localeProvider, child) {
          return ListView.builder(
            itemCount: _language.length,
            // primary: false,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              Locale _locale = _language[index].locale;
              bool _isSelected = _language[index].locale == localeProvider.locale;
              return CardTile(
                onTap: () {
                  localeProvider.setLocale(_locale);
                },
                leading: SizedBox(
                  width: 34,
                  child: Image.asset(
                    L10n.getFlag(_language[index].locale.languageCode),
                  ),
                ),
                title: _language[index].title,
                trailing: AnimatedContainer(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _isSelected ? white : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: blue, width: _isSelected ? 7 : 2.5),
                  ), duration: const Duration(milliseconds: 200),
                ),
              );
            },
          );
        })
        // body: ListView(
        //   children: [
        //     CardTile(
        //       onTap: () {},
        //       leading: SizedBox(
        //         width: 34,
        //         child: Image.asset(
        //           Images.imageIndonesiaFlag,
        //         ),
        //       ),
        //       title: 'Indonesia',
        //       trailing: Container(
        //         width: 24,
        //         height: 24,
        //         decoration: BoxDecoration(
        //           color: white,
        //           shape: BoxShape.circle,
        //           border: Border.all(color: blue, width: 6),
        //         ),
        //       ),
        //     ),
        //     CardTile(
        //       onTap: () {},
        //       leading: SizedBox(
        //         width: 34,
        //         child: Image.asset(
        //           Images.imageEnglishFlag,
        //         ),
        //       ),
        //       title: 'English',
        //       trailing: Container(
        //         width: 24,
        //         height: 24,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           border: Border.all(color: blue, width: 2),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
