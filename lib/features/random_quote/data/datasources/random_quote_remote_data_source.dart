import 'package:quotes/core/api/api_consumer.dart';

import 'package:quotes/features/random_quote/data/models/quote_model.dart';

import '../../../../core/api/endpoints.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
    );
    return QuoteModel.fromJson(response);
  }
}
