part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}

final class FailedToNewsetBooksState extends NewsetBooksState {
  final String errMsg;

  const FailedToNewsetBooksState(this.errMsg);
}

final class SusseccToNewsetBooksState extends NewsetBooksState {
  final List<BookModel> books;
  const SusseccToNewsetBooksState({
    required this.books,
  });
}

class LoadingToNewsetBooksState extends NewsetBooksState {}
