class GalleryModel {
  int? id;
  String? url;

  GalleryModel({
    this.id,
    this.url,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
