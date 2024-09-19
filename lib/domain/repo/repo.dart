import 'dart:convert';
import '../../model/font.dart';
import '../../model/main.dart';
import '../const.dart';
import '../../model/category.dart';
import 'package:http/http.dart' as http;

class Repository{

  Future<MainItem> _fetchData() async {
    final res = await http.get(Uri.parse(Const.mainUrl));
    final map = jsonDecode(res.body) as Map<String,dynamic>;
    return MainItem.fromJson(map);
  }

  Future<(List<CategoryItem>, List<FontItem>)> fetchData() async {
    final fetched = await _fetchData();
    fetched.categories.insert(0, CategoryItem(name: "Featured", items: fetched.featured));
    return (fetched.categories, fetched.slider);
  }
}