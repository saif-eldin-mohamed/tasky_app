import 'package:json_annotation/json_annotation.dart';
part 'todo_response.g.dart';


@JsonSerializable()
class TodoResponse {
  @JsonKey(name: '_id')
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
    String? createdAt;
     String? updatedAt;
  TodoResponse({this.createdAt,this.desc,this.id,this.image,this.priority,this.status,this.title,this.updatedAt,this.user});

  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);
}
