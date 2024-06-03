class Picture {
  int? id;
  String? pictureUrl;

  Picture({this.id, this.pictureUrl});

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        id: json['id'] as int?,
        pictureUrl: json['pictureUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pictureUrl': pictureUrl,
      };
}
