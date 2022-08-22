import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String lang});
  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;

  LangLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLang({required String lang}) async =>
      await sharedPreferences.setString(AppStrings.locale, lang);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)!
          : AppStrings.englishCode;
}
