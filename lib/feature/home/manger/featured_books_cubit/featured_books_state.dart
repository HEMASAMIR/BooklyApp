part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

class FailedToFeaturedBooksState extends FeaturedBooksState {
  final String errMsg;

  const FailedToFeaturedBooksState(this.errMsg);
}

class SuccessToFeaturedBooksState extends FeaturedBooksState {
  final List<BookModel> books;
  const SuccessToFeaturedBooksState({
    required this.books,
  });
}

class LoadingToFeaturedBooksState extends FeaturedBooksState {}
