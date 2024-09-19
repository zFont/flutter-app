import 'package:json_annotation/json_annotation.dart';
import 'package:zfont/model/font.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryItem {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "items", readValue: readValue)
  final List<FontItem> items;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);

  CategoryItem({required this.name, required this.items});

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);

  static readValue(Map<dynamic, dynamic> map, String key){
    final list = map[key] as List;
    final name = map['name'];
    final out = list.map((e) {
      final itemMap = Map<String, dynamic>.from(e);
      itemMap['c'] = name;
      return itemMap;
    }).toList();
    return out;
  }
}