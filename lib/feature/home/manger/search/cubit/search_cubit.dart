import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;

  Future<void> serachBook({required String value}) async {
    emit(LoadingToSearchBook());
    final result = await homeRepo.searchBook(searchBook: value);
    result.fold((failure) {
      log('Faileeeeeeeeeed to search a book : ${failure.errMsg}');
      emit(FailedToSearchBook(failure.errMsg));
    }, (books) {
      print('Sussceeessssssss  to saeach book');
      emit(SuccessToSearchBook(books: books));
    });
  }
}
