import 'package:json_annotation/json_annotation.dart';
import 'package:zfont/model/category.dart';
import 'font.dart';

part 'main.g.dart';

@JsonSerializable()
class MainItem {
  final List<FontItem> slider;

  final List<FontItem> featured;

  final List<CategoryItem> categories;

  factory MainItem.fromJson(Map<String, dynamic> json) => _$MainItemFromJson(json);

  MainItem({required this.slider, required this.featured, required this.categories});

  Map<String, dynamic> toJson() => _$MainItemToJson(this);
}