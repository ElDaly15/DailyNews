import 'package:daily_news/core/loading/fake_list_of_news.dart';
import 'package:daily_news/core/loading/sliver_loading_list_of_latest_news.dart';
import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:daily_news/featuers/latest/data/Models/selected_news_category_model.dart';
import 'package:daily_news/featuers/latest/presentation/views/widgets/container_of_selected_news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLatestNewsLoadingBody extends StatefulWidget {
  const CustomLatestNewsLoadingBody({super.key, required this.index});
  final int index;

  @override
  State<CustomLatestNewsLoadingBody> createState() =>
      _LatestNewsViewBodyState();
}

class _LatestNewsViewBodyState extends State<CustomLatestNewsLoadingBody> {
  final List<CategoryNews> categories = [
    CategoryNews(
      title: 'All',
      iconData: FontAwesomeIcons.solidNewspaper,
    ),
    CategoryNews(
      title: 'Business',
      iconData: FontAwesomeIcons.businessTime,
    ),
    CategoryNews(
      title: 'Entertainment',
      iconData: FontAwesomeIcons.faceLaugh,
    ),
    CategoryNews(
      title: 'Health',
      iconData: FontAwesomeIcons.heartCircleCheck,
    ),
    CategoryNews(
      title: 'Science',
      iconData: FontAwesomeIcons.flask,
    ),
    CategoryNews(
      title: 'Sports',
      iconData: FontAwesomeIcons.tableTennisPaddleBall,
    ),
  ];

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: CustomViewsAppBar(
              title: 'Latest News',
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 22, right: 4)
                      : index == categories.length - 1
                          ? const EdgeInsets.only(left: 4, right: 22)
                          : const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        myIndex = index;
                      });
                    },
                    child: Skeletonizer(
                      effect: ShimmerEffect(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        duration: const Duration(seconds: 1),
                      ),
                      enabled: true,
                      child: ContainerOfSelectedNews(
                        isChecked: index == widget.index,
                        title: categories[index].title,
                        iconData: categories[index].iconData,
                        onTap: () {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                duration: const Duration(seconds: 1),
              ),
              enabled: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: SliverLoadingListOfLatestNews(
                  newsList: fakeListOfNews,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
