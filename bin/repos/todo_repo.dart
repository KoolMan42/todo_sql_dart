import 'package:postgres_pool/postgres_pool.dart';


class TodoRepo {
  PgPool? _pgPool;

  TodoRepo(PgPool pool) {
    _pgPool = pool;
  }

  Future<List<String>> getAllTodos() async {
    List<Map<String, Map<String, dynamic>>> allTodosPostgres =  await _pgPool!.mappedResultsQuery("select * from todos");
    // print(allTodosPostgres.toString());
    // List<String> allTodos = allTodosPostgres.map((e) => e[0][0].toString()).toList();
    List<String> allTodos = [];
    for(final i in allTodosPostgres){
      // print(i["todos"].toString());
      var todoData = i["todos"];
      allTodos.add(todoData.toString());

    }

    return allTodos;
  }
}
