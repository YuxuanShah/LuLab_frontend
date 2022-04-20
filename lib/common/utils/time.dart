import 'package:date_format/date_format.dart';

class TimeChange {
  static client(var stamp, String value) {
    var time = DateTime.now();
    if (stamp is int) {
      time = DateTime.fromMillisecondsSinceEpoch(stamp);
    } else if (stamp is String) {
      var a = int.parse(stamp);
      time = DateTime.fromMillisecondsSinceEpoch(a);
    }

    if (value == "y") {
      return formatDate(time, [yyyy]);
    } else if (value == "m") {
      return formatDate(time, [mm]);
    } else if (value == "d") {
      return formatDate(time, [dd]);
    } else if (value == "h") {
      return formatDate(time, [hh]);
    } else if (value == "n") {
      return formatDate(time, [nn]);
    } else if (value == "s") {
      return formatDate(time, [ss]);
    } else if (value == "ymd") {
      return formatDate(time, [yyyy, '年', mm, '月', dd, '日']);
    } else if (value == "md") {
      return formatDate(time, [mm, '月', dd, '日']);
    } else if (value == "ym") {
      return formatDate(time, [yyyy, '年', mm, '月']);
    }
  }
}
