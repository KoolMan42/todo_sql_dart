import 'package:postgresql2/postgresql.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'todo_repo.dart';

part 'todo_service.g.dart';

class TodoService {
  TodoRepo? _repo;

  TodoService(Connection connection) {
    _repo = TodoRepo(connection);
  }

  @Route.get("/todos")
  Future<Response> showAllTodos(Request request) async {
    return Response.ok(await _repo!.getAllTodos());
  }

  Router get router => _$TodoServiceRouter(this);
}
