import 'package:test/expect.dart';
import 'package:todo_sql_dart/models/todo.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("Do they have the same id??", () {
    final todo1 = Todo("Test the damn object");
    final todo2 = Todo("Another todo lmao");

    expect(todo1.id, isNot(todo2.id));
  });

  test("Are they the same??", () {
    final id = 'test';

    final todo1 = Todo("Ello", id, true);
    final todo2 = Todo("Ello", id, true);

    expect(todo1.id, (todo2.id));
    expect(todo1.name, (todo2.name));
    expect(todo1.isDone, (todo2.isDone));
  });
}
