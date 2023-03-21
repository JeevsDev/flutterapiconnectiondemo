// To parse this JSON data, do
//
//     final PostModel = PostModelFromJson(jsonString);

import 'dart:convert';

PostModel PostModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String PostModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    PostModel({
        required this.name,
        required this.job,
        required this.id,
        required this.createdAt,
    });

    String name;
    String job;
    String id;
    DateTime createdAt;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

  get body => null;

  get title => null;

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}
