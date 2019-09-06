import 'package:json_annotation/json_annotation.dart';

part 'trending_developer_model.g.dart';

class TrendingDeveloperModel {
  List<TrendingDeveloperItem> list;

  TrendingDeveloperModel._internal(this.list);

  factory TrendingDeveloperModel.fromJson(dynamic json) {
    return TrendingDeveloperModel.fromMapList(list: json as List);
  }

  factory TrendingDeveloperModel.fromMapList({List<dynamic> list}) {
    final items = list.cast<Map<String, Object>>().map((Map<String, Object> item) {
      return TrendingDeveloperItem.fromJson(item);
    }).toList();
    return TrendingDeveloperModel._internal(items);
  }
}

@JsonSerializable()
class TrendingDeveloperItem {
  final String username;
  final String name;
  final String type;
  final String url;
  final String avatar;
  final Repo repo;

  TrendingDeveloperItem(this.username, this.name, this.type, this.url, this.avatar, this.repo);

  factory TrendingDeveloperItem.fromJson(Map<String, dynamic> json) => _$TrendingDeveloperItemFromJson(json);
}

@JsonSerializable()
class Repo {
  final String name;
  final String description;
  final String url;

  Repo(
    this.name,
    this.description,
    this.url,
  );

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
}
