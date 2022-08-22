import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuoteUseCase extends UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;
  GetRandomQuoteUseCase({
    required this.quoteRepository,
  });

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRepositoryQuote();
  }
}
