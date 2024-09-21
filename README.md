# zFont

Welcome to the [zFont](https://play.google.com/store/apps/details?id=com.htetznaing.zfont2) app, now built with Flutter!  
I've wanted to make zFont for the web for a long time, but I lacked experience with web technologies and was admittedly a bit too lazy to learn them :P  
Now, I’m building it in Flutter, since I have some familiarity with it :D

## Getting Started

This project serves as the starting point for a Flutter application.

If this is your first time working with Flutter, here are a few resources to help you get up to speed:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For additional Flutter development guidance, check out the [official documentation](https://docs.flutter.dev/), which includes tutorials, samples, tips for mobile development, and a comprehensive API reference.

## Dataset

All fonts in the zFont app are hosted on this [repository](https://github.com/zFont/main/).  
In this Flutter app, we fetch data from [full.json](https://github.com/zFont/main/blob/main/full.json).  
The repository is automatically updated weekly, fetching the latest fonts from the zFont official API.  
Feel free to use this data in your own projects if you'd like.

## Known Issues

zFont uses Google Blogger to host its thumbnails and preview images, but this causes CORS errors on the web platform. To resolve this issue, I created a Cloudflare Worker to act as a proxy. The source code for the image proxy can be found in the [image-proxy](image-proxy) directory.

## Packages and Tools Used

- [JSON and Serialization](https://docs.flutter.dev/data-and-backend/serialization/json)
- [icons_launcher](https://pub.dev/packages/icons_launcher)
- [Icon Kitchen](https://icon.kitchen/)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)