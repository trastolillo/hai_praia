extension DateTimeExtension on DateTime {
  DateTime get onlyDate => DateTime(year, month, day);

  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;

  static DateTime fromSecondsSinceEpoch(int seconds) =>
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
}

// Redondea la hora en tercios a la hora local empezando en las
// 00 horas.
// int roundTimeInThirds(int millisecondsSinceEpoch) {
//   final date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
//   final tercios = date.hour ~/ 3;
//   final resto = date.hour.toDouble() / 3 - tercios;
//   final horaFinal = resto < 0.5 ? tercios * 3 : (tercios + 1) * 3;
//   return DateTime(date.year, date.month, date.day, horaFinal)
//       .millisecondsSinceEpoch;
// }

int monthStringToInt(String monthString) {
  switch (monthString.toLowerCase()) {
    case 'enero':
      return 1;
      break;
    case 'febrero':
      return 2;
      break;
    case 'marzo':
      return 3;
      break;
    case 'abril':
      return 4;
      break;
    case 'mayo':
      return 5;
      break;
    case 'junio':
      return 6;
      break;
    case 'julio':
      return 7;
      break;
    case 'agosto':
      return 8;
      break;
    case 'septiembre':
      return 9;
      break;
    case 'octubre':
      return 10;
      break;
    case 'noviembre':
      return 11;
      break;
    case 'diciembre':
      return 12;
      break;
    default:
      throw const FormatException(
          "Error en date_utils.dart - monthStringToInt");
  }
}
