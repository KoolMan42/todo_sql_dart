import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  static final Uuid _uuid = Uuid();
  String id = _uuid.v4();

  String name = "";
  bool isDone = false;

  Todo(String id, String name, bool isDone) {
    this.id = id;
    this.name = name;
    this.isDone = isDone;
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
