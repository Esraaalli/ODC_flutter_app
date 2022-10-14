class NewsModel {
  NewsModel({
    num? id,
    String? date,
    String? body,
    String? imageUrl,
    String? linkUrl,
    String? title,
  }) {
    _id = id;
    _date = date;
    _body = body;
    _imageUrl = imageUrl;
    _linkUrl = linkUrl;
    _title = title;
  }

  NewsModel.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _body = json['body'];
    _imageUrl = json['imageUrl'];
    _linkUrl = json['linkUrl'];
    _title = json['title'];
  }

  num? _id;
  String? _date;
  String? _body;
  String? _imageUrl;
  String? _linkUrl;
  String? _title;

  num? get id => _id;

  String? get date => _date;

  String? get body => _body;

  String? get imageUrl => _imageUrl;

  String? get linkUrl => _linkUrl;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['body'] = _body;
    map['imageUrl'] = _imageUrl;
    map['linkUrl'] = _linkUrl;
    map['title'] = _title;
    return map;
  }
}