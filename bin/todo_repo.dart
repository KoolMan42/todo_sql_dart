import 'package:postgres_pool/postgres_pool.dart';

import 'todo.dart';

class TodoRepo {
  PgPool? _pgPool;

  TodoRepo(PgPool pool) {
    _pgPool = pool;
  }

  Future<List<Todo>> getAllTodos() async {
    List<PostgreSQLResult> allTodosPostgres =
        await _pgPool!.query("select * from todos").asStream().toList();
    List<Todo> allTodos =
        allTodosPostgres.map((e) => Todo(e[0], e[1], e[2])).toList();
    return allTodos;
  }
}
