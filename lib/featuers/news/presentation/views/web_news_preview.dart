import 'package:daily_news/core/utils/app_colors.dart';
import 'package:daily_news/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebNewsPreview extends StatefulWidget {
  const WebNewsPreview({super.key, required this.newsUrl});
  final String newsUrl;

  @override
  State<WebNewsPreview> createState() => _WebNewsPreviewState();
}

class _WebNewsPreviewState extends State<WebNewsPreview> {
  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorTheme,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'News Preview',
          style: TextStyles.font24Medium(context)
              .copyWith(color: AppColors.whiteColor),
        ),
      ),
      body: InAppWebView(
          // ignore: deprecated_member_use
          initialOptions: InAppWebViewGroupOptions(
            // ignore: deprecated_member_use
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
            ),
          ),
          onWebViewCreated: (controller) {
            inAppWebViewController = controller;
            inAppWebViewController?.loadUrl(
                urlRequest: URLRequest(
              url: WebUri(widget.newsUrl),
            ));
          }),
    );
  }
}
