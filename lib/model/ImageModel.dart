class ImageModel {
  String? thumbnailUrl;
  String? imageUrl;
  int? width;
  int? height;
  String? displaySitename;

  ImageModel({
    this.thumbnailUrl,
    this.imageUrl,
    this.width,
    this.height,
    this.displaySitename,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      thumbnailUrl: json['thumbnail_url'],
      imageUrl: json['image_url'],
      width: json['width'],
      height: json['height'],
      displaySitename: json['display_sitename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail_url': thumbnailUrl,
      'image_url': imageUrl,
      'width': width,
      'height': height,
      'display_sitename': displaySitename,
    };
  }
}