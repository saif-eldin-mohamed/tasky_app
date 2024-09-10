// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoResponse _$TodoResponseFromJson(Map<String, dynamic> json) => TodoResponse(
      createdAt: json['createdAt'] as String?,
      desc: json['desc'] as String?,
      id: json['_id'] as String?,
      image: json['image'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      updatedAt: json['updatedAt'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$TodoResponseToJson(TodoResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
