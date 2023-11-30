// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      url: json['url'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      techStack: json['techStack'] as String? ?? '',
      urlLivePreview: json['urlLivePreview'] as String? ?? '',
      urlViewCode: json['urlViewCode'] as String? ?? '',
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'content': instance.content,
      'techStack': instance.techStack,
      'urlLivePreview': instance.urlLivePreview,
      'urlViewCode': instance.urlViewCode,
    };
