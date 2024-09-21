import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/feature/home/manger/cubit/similar_books_cubit.dart';
import 'package:bookly_app/feature/home/manger/search/cubit/search_cubit.dart';
import 'package:bookly_app/feature/home/presentation/view/book_details.dart';
import 'package:bookly_app/feature/home/presentation/view/home.dart';
import 'package:bookly_app/feature/home/presentation/view/search/presentation/view/search.dart';
import 'package:bookly_app/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kBookDeatils,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSerachView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchCubit(getIt.get<HomeRepoImp>()),
            child: const SerachView()),
      ),
    ],
  );

  static const kHomeView = '/homeView';
  static const kBookDeatils = '/bookDetails';
  static const kSerachView = '/searchView';
}
