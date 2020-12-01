import 'package:intl/intl.dart';

class Strings {
  static String toTitleCase(String sentence) {
    String titleCaseVar = sentence
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');

    return titleCaseVar;
  }

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }

  static String openWeatherAppId = "ed60fcfbd110ee65c7150605ea8aceea";
  static String newsAppId = "2b363bb3c76a42cc81fc9da414788277";
}
