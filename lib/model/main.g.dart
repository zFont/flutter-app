// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainItem _$MainItemFromJson(Map<String, dynamic> json) => MainItem(
      slider: (json['slider'] as List<dynamic>)
          .map((e) => FontItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured: (json['featured'] as List<dynamic>)
          .map((e) => FontItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainItemToJson(MainItem instance) => <String, dynamic>{
      'slider': instance.slider,
      'featured': instance.featured,
      'categories': instance.categories,
    };
