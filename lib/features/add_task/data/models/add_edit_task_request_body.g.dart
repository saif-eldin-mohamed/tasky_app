// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditTaskRequestBody _$AddEditTaskRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddEditTaskRequestBody(
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] as String,
    );

Map<String, dynamic> _$AddEditTaskRequestBodyToJson(
        AddEditTaskRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
