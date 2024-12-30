import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  bool isBold = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesNewsRemoveLogo,
          width: 100,
        ),
        const Spacer(),
        IconButton(
          color: AppColors.whiteColor,
          onPressed: () {
            setState(() {
              isBold = !isBold;
            });
          },
          icon: Icon(
            isBold ? FontAwesomeIcons.solidBell : FontAwesomeIcons.bell,
          ),
        ),
      ],
    );
  }
}
