part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

class FailedToSimilarBooksState extends SimilarBooksState {
  final String errMsg;

  const FailedToSimilarBooksState(this.errMsg);
}

class SuccessToSimilarBooksState extends SimilarBooksState {
  final List<BookModel> books;
  const SuccessToSimilarBooksState({
    required this.books,
  });
}

class LoadingToSimilarBooksState extends SimilarBooksState {}
