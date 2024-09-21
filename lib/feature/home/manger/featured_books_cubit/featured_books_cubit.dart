import 'package:bloc/bloc.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(LoadingToFeaturedBooksState());
    final result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FailedToFeaturedBooksState(failure.errMsg));
    }, (books) {
      emit(SuccessToFeaturedBooksState(books: books));
    });
  }
}
