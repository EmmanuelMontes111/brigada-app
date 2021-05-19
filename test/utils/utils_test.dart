import 'package:brigadapoli/src/utils/utils.dart' as utils;
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('validate string when is numeric', () {
    String numeric = "4571516";
    bool isNumeric = utils.isNumeric(numeric);
    expect(isNumeric, true);
  });

  test('validate string when not is numeric', () {
    String numeric = "letras123";
    bool isNumeric = utils.isNumeric(numeric);
    expect(isNumeric, false);
  });

}
