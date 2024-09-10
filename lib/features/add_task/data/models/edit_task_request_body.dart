import 'package:json_annotation/json_annotation.dart';
part 'edit_task_request_body.g.dart';

@JsonSerializable()
class EditTaskRequestBody {
  final String image;
  final String title;
  final String desc;
  final String status;
  final String user;
  final String priority;
  final String dueDate;

  EditTaskRequestBody(
      {required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.dueDate,
      required this.status,
      required this.user});

  Map<String, dynamic> toJson() => _$EditTaskRequestBodyToJson(this);
}
