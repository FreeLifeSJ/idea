// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeBannerDataBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerDataBean _$HomeBannerDataBeanFromJson(Map<String, dynamic> json) {
  return HomeBannerDataBean(
      json['desc'] as String,
      json['id'] as int,
      json['imagePath'] as String,
      json['isVisible'] as int,
      json['order'] as int,
      json['title'] as String,
      json['type'] as int,
      json['url'] as String);
}

Map<String, dynamic> _$HomeBannerDataBeanToJson(HomeBannerDataBean instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
