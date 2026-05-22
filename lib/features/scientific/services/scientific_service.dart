import 'package:math_expressions/math_expressions.dart';

class ScientificService {
  static String calculate(String expression) {
    try {
      // REMOVE INVALID OPERATOR CHAINS
      expression = expression.replaceAllMapped(

        RegExp(r'([\+\-\×\÷\%\^]){2,}'),

            (match) {

          return match.group(0)![0];
        },
      );
      expression = expression

          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll(")(", ")*(")
          .replaceAllMapped(

        RegExp(r'\be\b'),

            (match) => "2.718281828",
      )
      // 2π -> 2*π
          .replaceAllMapped(

        RegExp(r'(\d)π'),

            (match) =>
        '${match.group(1)}*π',
      )
          .replaceAll("π", "3.14159265359")
          .replaceAllMapped(

        RegExp(r'(\d)\('),

            (match) =>
        '${match.group(1)}*(',
      )

          .replaceAllMapped(

        RegExp(r'(\d)([a-zA-Z])'),

            (match) =>
        '${match.group(1)}*${match.group(2)}',
      );
      expression = expression
          .replaceAll("log(", "log(");
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
