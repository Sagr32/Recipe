import 'package:html/parser.dart' show parse;

String parseHtml(String? inputString) {
  return parse(inputString).body!.text;
}
