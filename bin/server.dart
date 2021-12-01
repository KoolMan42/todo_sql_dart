import 'dart:io';

import 'package:postgres_pool/postgres_pool.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'services/todo_service.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  // Configure a pipeline that logs requests.

  PgPool _postgres_pool = PgPool(
      PgEndpoint(host: "127.0.0.1", port: 5432, username: "dev", database: "todos", password: "dev"),
      settings: PgPoolSettings()..concurrency = 6);

  final _todoService = TodoService(_postgres_pool);
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_todoService.router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '42069');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}
