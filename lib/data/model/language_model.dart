import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

class LanguageModel {
  List<LanguageItem> list;

  LanguageModel._internal(this.list);

  factory LanguageModel.fromJson(dynamic json) {
    return LanguageModel.fromMapList(list: json as List);
  }

  factory LanguageModel.fromMapList({List<dynamic> list}) {
    final items =
        list.cast<Map<String, Object>>().map((Map<String, Object> item) {
      return LanguageItem.fromJson(item);
    }).toList();
    return LanguageModel._internal(items);
  }
}

@JsonSerializable()
class LanguageItem {
  final String urlParam;
  final String name;

  LanguageItem(
    this.urlParam,
    this.name,
  );

  factory LanguageItem.fromJson(Map<String, dynamic> json) =>
      _$LanguageItemFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageItemToJson(this);
  @override
  bool operator ==(other) {
    return other is LanguageItem && name == other.name && urlParam == other.urlParam;
  }

  @override
  int get hashCode {
    return name.hashCode ^ urlParam.hashCode;
  }
}
