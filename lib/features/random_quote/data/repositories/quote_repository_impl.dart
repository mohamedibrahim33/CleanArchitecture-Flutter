// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/exceptions.dart';

import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

import '../../../../core/network/network_info.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteLocalDataSource,
    required this.randomQuoteRemoteDataSource,
  });
  @override
  Future<Either<Failure, Quote>> getRepositoryQuote() async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteRandomQuote =
          await randomQuoteRemoteDataSource.getRandomQuote();
      randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
      return right(remoteRandomQuote);
    } on ServerException {
      return left(ServerFailure());
    }
    // } else {
    // try {
    //   final localRandomQuote =
    //       await randomQuoteLocalDataSource.getLastRandomQuote();
    //   return right(localRandomQuote);
    // } on CacheException {
    //   return left(CacheFailure());
    // }
    // }
  }
}
