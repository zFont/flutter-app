// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FontItem _$FontItemFromJson(Map<String, dynamic> json) => FontItem(
      category: json['c'] as String,
      author: json['a'] as String?,
      authorLink: json['a_l'] as String?,
      size: json['s'] as String,
      url: json['u'] as String,
      name: json['n'] as String,
      thumb: FontItem.fixThumbnail(json['t'] as String),
      preview: FontItem.fixPreview(json['p'] as String?),
    );

Map<String, dynamic> _$FontItemToJson(FontItem instance) => <String, dynamic>{
      'a': instance.author,
      'a_l': instance.authorLink,
      's': instance.size,
      'u': instance.url,
      'n': instance.name,
      't': instance.thumb,
      'p': instance.preview,
      'c': instance.category,
    };
