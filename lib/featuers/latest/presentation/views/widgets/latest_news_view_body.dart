import 'package:daily_news/core/widgets/headers/custom_app_header.dart';
import 'package:daily_news/featuers/latest/presentation/views/widgets/container_of_selected_news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LatestNewsViewBody extends StatelessWidget {
  const LatestNewsViewBody({super.key});

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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 22, right: 4)
                        : index == 4
                            ? const EdgeInsets.only(left: 4, right: 22)
                            : const EdgeInsets.symmetric(horizontal: 4),
                    child: ContainerOfSelectedNews(
                      title: 'All',
                      iconData: FontAwesomeIcons.solidNewspaper,
                      onTap: () {},
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
