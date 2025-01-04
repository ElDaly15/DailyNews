import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/home/presentation/views/widgets/custom_list_view_of_latest_news.dart';
import 'package:daily_news/featuers/search/presentation/manager/get_search_news_cubit/get_search_news_cubit.dart';
import 'package:daily_news/featuers/search/presentation/views/widgets/search_handle_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchNewsCubit, GetSearchNewsState>(
      builder: (context, state) {
        if (state is GetSearchNewsSuccess) {
          if (state.news.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: ErrorSearchWidget(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Results',
                      style: TextStyles.font22Bold(context)
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomListViewOfLatestNews(
                      isSearch: true,
                      latestNews: state.news,
                    ),
                  ],
                ),
              ),
            );
          }
        } else if (state is GetSearchNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          );
        } else if (state is GetSearchNewsInitial) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: StartSearchWidget(),
          );
        } else {
          return const ErrorSearchWidget();
        }
      },
    );
  }
}
