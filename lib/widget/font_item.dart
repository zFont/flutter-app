import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zfont/domain/dimen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zfont/domain/ext/ext.dart';
import '../model/font.dart';

class FontCard extends StatelessWidget {
  final FontItem item;

  const FontCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(Dimen.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                        text: item.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          if (item.author != null)
                            TextSpan(
                              text: ' by ${item.author}',
                              style: Theme.of(context).textTheme.bodySmall,
                              recognizer: item.authorLink == null
                                  ? null
                                  : (TapGestureRecognizer()
                                    ..onTap = () =>
                                        _openLink(context, item.authorLink!)),
                            ),
                        ]),
                  ),
                ),
                Text(item.size),
              ],
            ),
            const SizedBox(
              height: Dimen.paddingSmallest,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 50,
                    child: Image.network(
                      color: (context.isDarkMode && !item.isColor) ? Colors.white : null,
                      item.thumb,
                      fit: BoxFit.contain,
                      loadingBuilder: (context,widget,event){
                        if (event == null) return widget;
                        return Image.asset("assets/loading.webp");
                      },
                      errorBuilder: (context, error, trace){
                        return Image.asset("assets/error.webp");
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _openLink(context, item.downloadUrl),
                  icon: Icon(
                    Icons.download_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openLink(BuildContext context, String link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      if (context.mounted) context.showSnack('Could not launch $url');
    }
  }
}
