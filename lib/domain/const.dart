class Const{
  static String mainUrl = "https://raw.githubusercontent.com/zFont/main/main/full.json";

  static int humanReadableSizeToBytes(String sizeStr) {
    sizeStr = sizeStr.trim().toUpperCase(); // Remove extra spaces and convert to uppercase
    Map<String, int> units = {
      'B': 1,
      'KB': 1024,
      'MB': 1024 * 1024,
      'GB': 1024 * 1024 * 1024,
      'TB': 1024 * 1024 * 1024 * 1024,
    };

    // Extract the numeric part and the unit part
    double size = double.parse(sizeStr.substring(0, sizeStr.length - 2).trim());
    String unit = sizeStr.substring(sizeStr.length - 2).trim();

    // Convert to bytes
    return (size * units[unit]!).toInt();
  }

  static String getDownloadHost(String size){
    final bytes = humanReadableSizeToBytes(size);
    const maxSizeInBytes = 19 * 1024 * 1024;
    if (bytes < maxSizeInBytes) {
      return "https://cdn.jsdelivr.net/gh/KhunHtetzNaing/zFont_Fonts@master";
    }
    return "https://github.com/KhunHtetzNaing/zFont_Fonts/raw/master";
  }
}