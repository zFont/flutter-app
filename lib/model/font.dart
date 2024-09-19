import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zfont/domain/const.dart';
part 'font.g.dart';

@JsonSerializable()
class FontItem {
  @JsonKey(name: "a")
  final String? author;

  @JsonKey(name: "a_l")
  final String? authorLink;

  @JsonKey(name: "s")
  final String size;

  @JsonKey(name: "u")

  final String url;

  @JsonKey(name: "n")
  final String name;

  @JsonKey(name: "t", fromJson: fixThumbnail)
  final String thumb;

  @JsonKey(name: "p", fromJson: fixPreview)
  final String? preview;

  @JsonKey(name: "c")
  final String category;

  factory FontItem.fromJson(Map<String, dynamic> json) => _$FontItemFromJson(json);

  FontItem({required this.category, required this.author, required this.authorLink, required this.size, required this.url, required this.name, required this.thumb, required this.preview});

  Map<String, dynamic> toJson() => _$FontItemToJson(this);

  // Helper function for URL conversion
  String _downloadUrl() {
    if (url.startsWith("http")) {
      return url;
    }
    return "${Const.getDownloadHost(size)}$url";
  }

  bool get isColor => ["Emoji","Color"].contains(category);

  String get downloadUrl => _downloadUrl();

  static String? fixPreview(String? url){
    if(url == null) return null;
    return fixThumbnail(url);
  }

  static String fixThumbnail(String url){
    // If web we need bypass CORS with proxy server
    if(kIsWeb && !url.contains("imgur.com")) return "https://image-proxy.khunhtetznaing.workers.dev/$url";

    // Otherwise nothing
    return url;
  }
}