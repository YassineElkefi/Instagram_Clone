import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language{
  final String name;
  final String flag;

  Language(this.name, this.flag);
}

class LanguageSelector extends StatefulWidget {
  final Function(Language)? onLanguageSelected;
  const LanguageSelector({
    super.key,
    this.onLanguageSelected
    });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late Language selectedLanguage;

  final List<Language> languages = [
    Language('English', '🇬🇧'),
    Language('Français', '🇫🇷'),
    Language('تونسي', '🇹🇳'),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Get the current locale from EasyLocalization
    Locale currentLocale = context.locale;

    // Find the matching language or default to English
    selectedLanguage = languages.firstWhere(
      (lang) => lang.name == _getLanguageNameFromLocale(currentLocale),
      orElse: () => languages.first, // Default to first language
    );
  }

  String _getLanguageNameFromLocale(Locale locale) {
    if (locale.languageCode == 'fr') {
      return 'Français';
    } else if (locale.languageCode == 'en') {
      return 'English';
    } else if (locale.languageCode == 'ar' && locale.countryCode == 'TN') {
      return 'تونسي';
    }
    return 'English'; // Default case
  }

  void _showLanguageMenu(BuildContext context, TapDownDetails details) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + button.size.height,
        buttonPosition.dx + button.size.width,
        buttonPosition.dy + button.size.height + 200,
      ),
      color: Colors.black,
      items: languages.map((Language language) {
        return PopupMenuItem<Language>(
          value: language,
          child: SizedBox(
            width: 150,
            child: Row(
              children: [
                Text(language.flag, style: TextStyle(fontSize: 20)),
                SizedBox(width: 8),
                Text(
                  language.name,
                  style: TextStyle(
                    color: selectedLanguage.name == language.name
                        ? Colors.blue
                        : Colors.white,
                    fontWeight: selectedLanguage.name == language.name
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ).then((Language? selected) {
      if (selected != null) {
        setState(() {
          selectedLanguage = selected;
        });
        widget.onLanguageSelected?.call(selected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _showLanguageMenu(context, details),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(selectedLanguage.flag, style: TextStyle(fontSize: 20)),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
