import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  //METHODS ONLy WITHOUT IMPLEMENTATION
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String categorey});
  Future<Either<Failure, List<BookModel>>> searchBook(
      {required String searchBook});
}
