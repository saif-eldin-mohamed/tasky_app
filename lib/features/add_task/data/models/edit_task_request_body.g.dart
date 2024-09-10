// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskRequestBody _$EditTaskRequestBodyFromJson(Map<String, dynamic> json) =>
    EditTaskRequestBody(
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] as String,
      status: json['status'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$EditTaskRequestBodyToJson(
        EditTaskRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'status': instance.status,
      'user': instance.user,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
