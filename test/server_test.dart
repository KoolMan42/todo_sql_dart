import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  final port = '42069';
  final host = 'http://127.0.0.1:$port';

  setUp(() async {
    await TestProcess.start(
      'dart',
      ['run', '/bin/server.dart'],
      environment: {'PORT': port},
    );
  });

  test('Check content type', () async {
    final response = await get(Uri.parse(host + '/todos'));
    expect(response.statusCode, 200);

    expect(response.headers["content-type"],'application/json' );

  });

  test('404', () async {
    final response = await get(Uri.parse(host + '/foobar'));
    expect(response.statusCode, 404);
  });
}
