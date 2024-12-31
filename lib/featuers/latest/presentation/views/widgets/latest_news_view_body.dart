import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:daily_news/featuers/latest/data/Models/selected_news_category_model.dart';
import 'package:daily_news/featuers/latest/presentation/views/widgets/container_of_selected_news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LatestNewsViewBody extends StatefulWidget {
  const LatestNewsViewBody({super.key});

  @override
  State<LatestNewsViewBody> createState() => _LatestNewsViewBodyState();
}

class _LatestNewsViewBodyState extends State<LatestNewsViewBody> {
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
    return CustomScrollView(
      slivers: [
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            sliver: SliverToBoxAdapter(child: SafeArea(child: SizedBox()))),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomViewsAppBar(
              title: 'Latest News',
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: SizedBox(
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
                      child: ContainerOfSelectedNews(
                        isChecked: index == myIndex,
                        title: categories[index].title,
                        iconData: categories[index].iconData,
                        onTap: () {},
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
