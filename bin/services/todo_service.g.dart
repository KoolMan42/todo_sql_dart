// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$TodoServiceRouter(TodoService service) {
  final router = Router();
  router.add('GET', r'/todos', service.showAllTodos);
  return router;
}
