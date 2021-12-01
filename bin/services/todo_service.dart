import 'package:postgres_pool/postgres_pool.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../repos/todo_repo.dart';

part 'todo_service.g.dart';

class TodoService {
  TodoRepo? _repo;

  TodoService(PgPool connection) {
    _repo = TodoRepo(connection);
  }

  @Route.get("/todos")
  Future<Response> showAllTodos(Request request) async {


    return Response.ok((await _repo!.getAllTodos()).toString(), headers: {"Content-type":"application/json"});
  }

  Router get router => _$TodoServiceRouter(this);
}
