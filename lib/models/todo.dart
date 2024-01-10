
import 'package:meta/meta.dart';
import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  String id;
  String description;
  String title;
  dynamic beginedAt;
  dynamic finishedAt;
  DateTime deadlineAt;
  String priority;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;

  Todo({
    required this.id,
    required this.description,
    required this.title,
    required this.beginedAt,
    required this.finishedAt,
    required this.deadlineAt,
    required this.priority,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  Todo copyWith({
    String? id,
    String? description,
    String? title,
    dynamic beginedAt,
    dynamic finishedAt,
    DateTime? deadlineAt,
    String? priority,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Todo(
        id: id ?? this.id,
        description: description ?? this.description,
        title: title ?? this.title,
        beginedAt: beginedAt ?? this.beginedAt,
        finishedAt: finishedAt ?? this.finishedAt,
        deadlineAt: deadlineAt ?? this.deadlineAt,
        priority: priority ?? this.priority,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    description: json["description"],
    title: json["title"],
    beginedAt: json["begined_at"],
    finishedAt: json["finished_at"],
    deadlineAt: DateTime.parse(json["deadline_at"]),
    priority: json["priority"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "title": title,
    "begined_at": beginedAt,
    "finished_at": finishedAt,
    "deadline_at": deadlineAt.toIso8601String(),
    "priority": priority,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
