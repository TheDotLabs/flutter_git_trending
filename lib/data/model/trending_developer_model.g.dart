// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_developer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingDeveloperItem _$TrendingDeveloperItemFromJson(
    Map<String, dynamic> json) {
  return TrendingDeveloperItem(
      json['username'] as String,
      json['name'] as String,
      json['type'] as String,
      json['url'] as String,
      json['avatar'] as String,
      json['repo'] == null
          ? null
          : Repo.fromJson(json['repo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TrendingDeveloperItemToJson(
        TrendingDeveloperItem instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
      'avatar': instance.avatar,
      'repo': instance.repo?.toJson()
    };

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(json['name'] as String, json['description'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'url': instance.url
    };
