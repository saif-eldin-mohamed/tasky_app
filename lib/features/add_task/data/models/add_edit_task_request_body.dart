
import 'package:json_annotation/json_annotation.dart';
part 'add_edit_task_request_body.g.dart';
@JsonSerializable()
class AddEditTaskRequestBody{
  final String image;
  final String title;
    final String desc;
        final String priority;
        final String dueDate;

  AddEditTaskRequestBody({required this.image, required this.title, required this.desc, required this.priority, required this.dueDate});

  Map<String, dynamic> toJson() => _$AddEditTaskRequestBodyToJson(this);
}