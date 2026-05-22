import 'package:math_expressions/math_expressions.dart';

class ScientificService {

  static String calculate(
      String expression,
      ) {

    try {

      // INVALID OPERATOR CHAINS
      if (

      RegExp(
        r'[\+\-\×\÷\%\^]{2,}',
      ).hasMatch(expression)

      ) {

        return "Error";
      }

      expression = expression

          .replaceAll('×', '*')

          .replaceAll('÷', '/')

          .replaceAll(")(", ")*(")

      // SAFE e replacement
          .replaceAllMapped(

        RegExp(r'\be\b'),

            (match) =>
        "2.718281828",
      )

      // 2π -> 2*π
          .replaceAllMapped(

        RegExp(r'(\d)π'),

            (match) =>

        '${match.group(1)}*π',
      )

          .replaceAll(
        "π",
        "3.14159265359",
      )

      // 45(9)
          .replaceAllMapped(

        RegExp(r'(\d)\('),

            (match) =>

        '${match.group(1)}*(',
      )

      // 2cos
          .replaceAllMapped(

        RegExp(
          r'(\d)([a-zA-Z])',
        ),

            (match) =>

        '${match.group(1)}*${match.group(2)}',
      )

          .replaceAll(
        "log(",
        "log10(",
      );

      final parser =
      ShuntingYardParser();

      final exp =
      parser.parse(expression);

      final contextModel =
      ContextModel();

      final result = exp.evaluate(

        EvaluationType.REAL,

        contextModel,
      );

      if (result % 1 == 0) {

        return result
            .toInt()
            .toString();
      }

      return result.toString();

    } catch (e) {

      return "Error";
    }
  }
}