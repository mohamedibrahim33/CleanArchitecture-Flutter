import 'dart:convert';

import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quotes/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomQuote, json.encode(quote));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      return Future.value(QuoteModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
