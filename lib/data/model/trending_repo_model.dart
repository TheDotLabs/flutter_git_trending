import 'package:json_annotation/json_annotation.dart';

part 'trending_repo_model.g.dart';

class TrendingRepoModel {
  List<TrendingRepoItem> list;

  TrendingRepoModel._internal(this.list);

  factory TrendingRepoModel.fromJson(dynamic json) {
    return TrendingRepoModel.fromMapList(list: json as List);
  }

  factory TrendingRepoModel.fromMapList({List<dynamic> list}) {
    final items =
        list.cast<Map<String, Object>>().map((Map<String, Object> item) {
      return TrendingRepoItem.fromJson(item);
    }).toList();
    return TrendingRepoModel._internal(items);
  }
}

@JsonSerializable()
class TrendingRepoItem {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;
  List<BuiltBy> builtBy;

  TrendingRepoItem({
    this.author,
    this.name,
    this.avatar,
    this.url,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.currentPeriodStars,
    this.builtBy,
  });

  factory TrendingRepoItem.fromJson(Map<String, dynamic> json) =>
      _$TrendingRepoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingRepoItemToJson(this);
}

@JsonSerializable()
class BuiltBy {
  String username;
  String href;
  String avatar;

  BuiltBy({
    this.username,
    this.href,
    this.avatar,
  });

  factory BuiltBy.fromJson(Map<String, dynamic> json) =>
      _$BuiltByFromJson(json);

  Map<String, dynamic> toJson() => _$BuiltByToJson(this);
}
