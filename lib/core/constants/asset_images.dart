// ignore_for_file: constant_identifier_names

enum AssetImages {
  ob1,
  ob2,
  ob3,
  scaffold_bg,
  google_icon,
}

extension AssetImagesX on AssetImages {
  static const String _basePath = 'assets/images';

  String get image => '$_basePath/$name.webp';
}
