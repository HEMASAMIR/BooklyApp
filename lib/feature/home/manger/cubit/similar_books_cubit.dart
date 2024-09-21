import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part '../cubit/similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetachSimilarBooks({required String categorey}) async {
    emit(LoadingToSimilarBooksState());
    final result = await homeRepo.fetchSimilarBooks(categorey: categorey);
    result.fold((failure) {
      log('Faileeeeeeeeeed : ${failure.errMsg}');
      emit(FailedToSimilarBooksState(failure.errMsg));
    }, (books) {
      emit(SuccessToSimilarBooksState(books: books));
    });
  }
}
