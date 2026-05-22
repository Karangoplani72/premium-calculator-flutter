import 'package:math_expressions/math_expressions.dart';

class ScientificService {
  static String calculate(String expression) {
    try {
      expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

      final ShuntingYardParser  parser = ShuntingYardParser();

      final Expression exp = parser.parse(expression);

     final ContextModel contextModel = ContextModel();

     final double result = exp.evaluate(EvaluationType.REAL, contextModel);

      if (result % 1 == 0) {
        return result.toInt().toString();
      }

      return result.toString();
    } catch (e) {
      return "Error";
    }
  }
}
