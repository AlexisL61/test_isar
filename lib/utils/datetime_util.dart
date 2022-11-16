enum DateTimeFormat {
  NORMAL,
  PHRASE
}



class DateTimeManager {
  /// Change un DateTime [date] en String.
  ///
  /// Ce string peut-être relatif à la date d'aujourd'hui avec [todayRelative] et peut inclure les heures avec [includeHours]
  /// Le format de la phrase renvoyé dépend de [format]. 
  /// 
  /// Si DateTimeFormat.NORMAL -> 01/01/2022 10:00:00
  /// 
  /// Si DateTimeFormat.PHRASE -> Le 01/01/2022 à 10:00:00
  static String dateTimeToString(DateTime date,
      {bool includeHours = true, bool todayRelative = false, DateTimeFormat format = DateTimeFormat.PHRASE}) {
    String dateFinale = "";

    DateTime now = DateTime.now();

    // Date sans les heures
    DateTime morningDate = DateTime(date.year, date.month, date.day);
    DateTime morningDateNow = DateTime(now.year, now.month, now.day);

    int days = morningDate.difference(morningDateNow).inDays;
    if (format == DateTimeFormat.PHRASE){
    switch (days) {
      case 0:
        dateFinale += "Aujourd'hui";
        break;
      case 1:
        dateFinale += "Demain";
        break;
      case -1:
        dateFinale += "Hier";
        break;
      default:
        if (todayRelative) {
          if (days > 1) {
            dateFinale += "Dans $days jours";
          } else {
            days = -days;
            dateFinale += "Il y a $days jours";
          }
        } else {
          dateFinale += "Le ${_formatNumberForDate(date.day)}/${_formatNumberForDate(date.month)}/${_formatNumberForDate(date.year)}";
        }
      }
    }else{
      dateFinale += "${_formatNumberForDate(date.day)}/${_formatNumberForDate(date.month)}/${_formatNumberForDate(date.year)}";
    }

    if (includeHours){
      if (format == DateTimeFormat.PHRASE){
        dateFinale+=" à";
      }
      dateFinale+=" ${_formatNumberForDate(date.hour)}:${_formatNumberForDate(date.minute)}:${_formatNumberForDate(date.second)}";
    }
    return dateFinale;
  }

  static String _formatNumberForDate(int number){
    if (number < 10){
      return "0$number";
    }else{
      return number.toString();
    }
  } 
}
