part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SuccessToSearchBook extends SearchState {
  final List<BookModel> books;

  const SuccessToSearchBook({required this.books});
}

final class FailedToSearchBook extends SearchState {
  final String errMsg;

  const FailedToSearchBook(this.errMsg);
}

final class LoadingToSearchBook extends SearchState {}
