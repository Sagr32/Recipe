import 'dart:io';

Future<String> fixture({required String fileName}) async =>
    await File('test/fixture/$fileName.json').readAsString();
