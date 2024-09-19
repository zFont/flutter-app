import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zfont/domain/ext/ext.dart';
import 'package:zfont/domain/repo/repo.dart';
import 'package:zfont/model/category.dart';
import 'package:zfont/model/font.dart';
import 'package:zfont/theme/theme.dart';
import 'package:zfont/theme/theme_manager.dart';
import 'domain/dimen.dart';
import 'widget/font_item.dart';

main() async {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: const MyApp(),
    )
  );
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
                final provider = Provider.of<ThemeNotifier>(context,listen: false);
                if(context.isDarkMode){
                  provider.setLightMode();
                }else{
                  provider.setDarkMode();
                }
              });
            },
            icon: Icon(context.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadConfig,
        child: items.isEmpty
            ? const Center(child: CircularProgressIndicator(),)
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
        shrinkExtent: 160,
        itemSnapping: true,
        children: List<Widget>.generate(slider.isEmpty ? 20 : slider.length, (int index) {
          final item = slider.isEmpty ? null : slider[index];
          return Container(
            color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
            child: item == null ? null : Image.network(
              item.preview!,
              fit: BoxFit.cover,
              errorBuilder: (context,error,tract){
                return Container();
              },
            ),
          );
        }),
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
        for(final e in items){
          final matched = e.items.where((e) => e.name.toLowerCase().contains(query));
          found.addAll(matched);
        }
        
        return [
          if(found.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimen.paddingMedium),
              child: Center(child: Text("No result for '$query'")),
            )
          else
            for(final item in found)...{
              FontCard(item: item)
            }
        ];
      },
    );
  }
}
