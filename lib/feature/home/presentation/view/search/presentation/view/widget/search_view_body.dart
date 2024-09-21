import 'package:bookly_app/feature/home/manger/search/cubit/search_cubit.dart';
import 'package:bookly_app/feature/home/presentation/view/search/presentation/view/widget/custom_text_field.dart';
import 'package:bookly_app/feature/home/presentation/view/search/presentation/view/widget/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); // تعريف formKey

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 30.0,
                ),
                // إضافة الـ Form حول الحقل
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        onChanged: (value) {
                          BlocProvider.of<SearchCubit>(context)
                              .serachBook(value: value);
                          // إضافة منطق للتحقق أو تحديث شيء بناءً على القيمة المدخلة
                        },
                        controller: searchController,
                        onFieldSubmitted: (value) {
                          // يمكنك تنفيذ التحقق هنا إذا لزم الأمر
                          if (formKey.currentState!.validate()) {
                            // تنفيذ المنطق عند التحقق بنجاح
                            BlocProvider.of<SearchCubit>(context)
                                .serachBook(value: value);
                            searchController.clear();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                const SearchListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
