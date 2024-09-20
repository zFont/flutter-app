import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zfont/domain/ext/ext.dart';
import 'package:zfont/domain/repo/repo.dart';
import 'package:zfont/model/category.dart';
import 'package:zfont/model/font.dart';
import 'package:zfont/theme/theme.dart';
import 'package:zfont/theme/theme_manager.dart';
import 'domain/dimen.dart';
import 'widget/font_item.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(Theme.of(context).textTheme);
    return MaterialApp(
      title: 'zFont',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: Provider.of<ThemeNotifier>(context).themeMode,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _repo = Repository();
  List<CategoryItem> items = [];
  List<FontItem> slider = [];
  int selected = 0;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final data = await _repo.fetchData();
    // Update state with the new list
    setState(() {
      slider
        ..clear()
        ..addAll(data.$2);
      items
        ..clear()
        ..addAll(data.$1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("zFont"),
        actions: [
          _search(),
          IconButton(
            onPressed: () {
              setState(() {
                final provider =
                    Provider.of<ThemeNotifier>(context, listen: false);
                if (context.isDarkMode) {
                  provider.setLightMode();
                } else {
                  provider.setDarkMode();
                }
              });
            },
            icon: Icon(context.isDarkMode
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded),
          ),
        ],
      ),
      drawer: NavigationDrawer(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimen.paddingLarge + Dimen.paddingSmallest,
                vertical: Dimen.paddingMedium),
            child: GestureDetector(
              child: Text(
                "zFont",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onTap: () => context.openLink(
                  "https://play.google.com/store/apps/details?id=com.htetznaing.zfont2"),
            ),
          ),
          const Divider(),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_rounded),
            label: Text("Main"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.font_download_rounded),
            label: Text("Google Fonts"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.face),
            label: Text("Font Squirrel"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.emoji_events_rounded),
            label: Text("DaFont"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.one_k_plus),
            label: Text("1001 Fonts"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.rocket_launch_rounded),
            label: Text("FontSpace"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.text_fields_rounded),
            label: Text("FontM"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.beach_access_rounded),
            label: Text("FFonts"),
          ),
          const Divider(),
          ListTile(
            title: Center(
                child: Text(
              "Developed by Khun Htetz Naing",
              style: Theme.of(context).textTheme.bodySmall,
            )),
            subtitle: Center(
                child: Text(
              "<Made with 💚 in Myanmar/>",
              style: Theme.of(context).textTheme.bodySmall,
            )),
            onTap: () {
              launchUrl(Uri.parse("https://github.com/zFont/flutter-app"));
            },
          )
        ],
        onDestinationSelected: (index) {
          if (index != 0) {
            context.showSnack("TODO!");
          }
          Navigator.pop(context);
        },
      ),
      body: RefreshIndicator(
        onRefresh: _loadConfig,
        child: items.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  _slider(),
                  _category(),
                  _list(),
                ],
              ),
      ),
    );
  }

  Widget _list() {
    final list = items[selected].items;
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(Dimen.paddingSmall),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 2 / 0.68,
        ),
        itemBuilder: (context, index) {
          return FontCard(item: list[index]);
        },
      ),
    );
  }

  Widget _category() {
    return SizedBox(
      height: kToolbarHeight + Dimen.paddingMedium,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items.elementAt(index);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimen.paddingSmall),
              child: Badge(
                label: Text(item.items.length.toString()),
                child: FilterChip(
                  selected: selected == index,
                  label: Text(item.name),
                  onSelected: (bool selected) {
                    setState(() {
                      this.selected = index;
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _slider() {
    return SizedBox(
      height: 160,
      child: CarouselView(
        itemExtent: 320,
        shrinkExtent: 60,
        itemSnapping: true,
        children: List<Widget>.generate(slider.isEmpty ? 10 : slider.length,
            (int index) {
          final item = slider.elementAtOrNull(index);
          return Container(
            color: Colors.primaries[index % Colors.primaries.length]
                .withOpacity(0.5),
            child: item == null
                ? null
                : Image.network(
                    item.preview!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, tract) {
                      return Container();
                    },
                  ),
          );
        }),
        onTap: (index) {
          final item = slider.elementAtOrNull(index);
          if (item != null) {
            context.openLink(item.downloadUrl);
          }
        },
      ),
    );
  }

  Widget _search() {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return IconButton(
          onPressed: () => controller.openView(),
          icon: const Icon(Icons.search_rounded),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final query = controller.text;
        List<FontItem> found = [];
        for (final e in items) {
          final matched =
              e.items.where((e) => e.name.toLowerCase().contains(query));
          found.addAll(matched);
        }

        return [
          if (found.isEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: Dimen.paddingMedium),
              child: Center(child: Text("No result for '$query'")),
            )
          else
            for (final item in found) ...{FontCard(item: item)}
        ];
      },
    );
  }
}
