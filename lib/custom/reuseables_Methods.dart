import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_todo_app/custom/my_dialogs.dart';

String myFormattedTimeOnly(String dateTime) {
  var time = DateFormat().add_jm().format(DateTime.parse(dateTime).toLocal());
  return time;
}

String myFormattedDateOnly(String dateTime) {
  var date =
      DateFormat("dd-MM-yyyy").format(DateTime.parse(dateTime).toLocal());
  return date;
}

String myFormattedDateTime(String dateTim) {
  var dateTime = DateFormat("dd-MM-yyyy")
      .add_jm()
      .format(DateTime.parse(dateTim).toLocal());
  return dateTime;
}

myShowLoadingIndication(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyLoadingIndicatorDialog();
      });
}
