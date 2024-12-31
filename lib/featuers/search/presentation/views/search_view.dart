import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:daily_news/featuers/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Automatically focus the text field when the page is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? searchValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorTheme,
        leading: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.whiteColor,
                ))),
        title: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: const TextSelectionThemeData(
              selectionColor: Color(0xffAE1F24),
              selectionHandleColor: Color(0xffAE1F24),
            ),
          ),
          child: TextField(
            onChanged: (value) {},
            focusNode: _focusNode,
            enabled: true,
            style: TextStyles.font18SemiBold(context).copyWith(
              color: AppColors.whiteColor,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyles.font18SemiBold(context).copyWith(
                color: AppColors.whiteColor,
              ),
              border: InputBorder.none,
            ),
            cursorColor: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.mainColorTheme,
      body: const SearchViewBody(),
    );
  }
}
