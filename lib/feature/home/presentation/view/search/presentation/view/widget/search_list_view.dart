import 'package:bookly_app/feature/home/presentation/view/widget/custom_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/core/widget/custom_text.dart';
import 'package:bookly_app/feature/home/manger/search/cubit/search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SuccessToSearchBook) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomBestSeller(
                  model: state.books[index],
                  // التأكد من استخدام نفس الحقل
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 5.0,
                  ),
              itemCount: state.books.length); // استخدام نفس الحقل هنا أيضاً
        } else if (state is FailedToSearchBook) {
          return const CustomErrText(
            text: 'Sorry, There is no search about this item',
          );
        } else if (state is FailedToSearchBook) {
          return CustomErrText(text: state.errMsg);
        } else {
          return const Center(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Serch Here about any books free',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ));
        }
      },
    );
  }
}
