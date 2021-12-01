import 'package:postgres_pool/postgres_pool.dart';

class TodoRepo {
  late PgPool _pgPool;

  TodoRepo(PgPool pool) {
    _pgPool = pool;
  }

  Future<List<String>> getAllTodos() async {
    List<Map<String, Map<String, dynamic>>> allTodosPostgres = await _pgPool.mappedResultsQuery("select * from todos");

    List<String> allTodos = allTodosPostgres.map((e) => e["todos"].toString()).toList();

    return allTodos;
  }
}
