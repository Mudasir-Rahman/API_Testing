class Model {
  int? userId;
  int? id;
  String? title;
  String? body;

  Model({this.userId, this.id, this.title, this.body});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };
}

