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
