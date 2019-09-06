// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_repo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingRepoItem _$TrendingRepoItemFromJson(Map<String, dynamic> json) {
  return TrendingRepoItem(
      author: json['author'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      url: json['url'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      languageColor: json['languageColor'] as String,
      stars: json['stars'] as int,
      forks: json['forks'] as int,
      currentPeriodStars: json['currentPeriodStars'] as int,
      builtBy: (json['builtBy'] as List)
          ?.map((e) =>
              e == null ? null : BuiltBy.fromJson(e as Map<String, dynamic>))
          ?.toList());
}


BuiltBy _$BuiltByFromJson(Map<String, dynamic> json) {
  return BuiltBy(
      username: json['username'] as String,
      href: json['href'] as String,
      avatar: json['avatar'] as String);
}

Map<String, dynamic> _$BuiltByToJson(BuiltBy instance) => <String, dynamic>{
      'username': instance.username,
      'href': instance.href,
      'avatar': instance.avatar
    };
