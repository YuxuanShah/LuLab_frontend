import 'dart:convert';

PostsData postsDataFromJson(String str) => PostsData.fromJson(json.decode(str));

String postsDataToJson(PostsData data) => json.encode(data.toJson());

class PostsData {
  PostsData({
    required this.latestCourse,
  });

  final List<LatestCourse> latestCourse;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
        latestCourse: List<LatestCourse>.from(
            json["latestCourse"].map((x) => LatestCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latestCourse": List<dynamic>.from(latestCourse.map((x) => x.toJson())),
      };
}

class LatestCourse {
  LatestCourse({
    required this.id,
    required this.title,
    required this.classTags,
    required this.description,
    required this.author,
    required this.authorTags,
    required this.category,
    required this.mode,
    required this.videoUrl,
    required this.duration,
  });

  final String id;
  final String title; //标题
  final String classTags; //分类标签
  final String description; //课程描述简介
  final String author; //作者
  final String authorTags; //作者的标签
  final String category; //文章的分类
  final String mode; //排版
  final String videoUrl; //视频链接
  final int duration; //视频时长

  factory LatestCourse.fromJson(Map<String, dynamic> json) => LatestCourse(
        id: json["_id"],
        title: json["title"],
        classTags: json["classTags"],
        description: json["description"],
        author: json["author"],
        authorTags: json["authorTags"],
        category: json["category"],
        mode: json["mode"],
        videoUrl: json["videoUrl"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "classTags": classTags,
        "description": description,
        "author": author,
        "authorTags": authorTags,
        "category": category,
        "mode": mode,
        "videoUrl": videoUrl,
        "duration": duration,
      };
}
