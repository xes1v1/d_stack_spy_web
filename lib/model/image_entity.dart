class ImageEntity {
  String target;
  String imageData;

  ImageEntity({this.target, this.imageData});

  ImageEntity.fromJson(Map<String, dynamic> json) {
    target = json['target'];
    imageData = json['imageData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['target'] = this.target;
    data['imageData'] = this.imageData;
    return data;
  }
}
