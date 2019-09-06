import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

class Constants {
  static final String syncAllActivity = "sync";
  static const TYPE_REPEATABLE = 'repeatable';

  static final int permissionDenied = 23;
  static final int permissionDeniedPermanently = 24;

  static const int PENDING = 0;
  static const int APPROVED = 1;
  static const int REJECTED = 2;
  static const double form_widget_left_padding = 16;
  static const double form_widget_header_top_padding = 20;
  static const double form_widget_top_padding = 12;
  static var form_widget_text_style = new TextStyle(fontSize: 16, color: Colors.grey[600]);
  static var FORM_WIDGET_TEXTFIELD_PADDING = EdgeInsets.only(left: 16, right: 20, top: 14, bottom: 14);
  static var FORM_WIDGET_PADDING_LR = const EdgeInsets.only(left: 24, right: 24);
  static var FORM_WIDGET_PADDING_LRTB = const EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 8);
  static var FORM_WIDGET_PADDING_LRB = const EdgeInsets.only(left: 24, right: 24, bottom: 8);
  static var FORM_WIDGET_PADDING_LRB_DROPDOWN = const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 6);

  static var COLOR_VALIDATION_ERROR = Colors.red.withOpacity(0.1);

  static const String ERROR_NETWORK_NOT_AVAILABLE = "Internet not available";
  static const String ERROR_SOMETHING_WRONG = "Something went wrong!";
  static const String ERROR_SOMETHING_WRONG_500 = "Something went wrong! ErrorCode: 500";

  //Plan Task Model names
  static const String assignee = "assignee";
  static const String description = "description";
  static const String followUpDate = "followUpDate";
  static const String taskStatus = "taskStatus";
  static const String targetWorkflow = "targetWorkflow";
  static const String data = "data";
  static const String createdAt = "createdAt";
  static const String id = "id";
  static final String taskCompleted = "Completed";
  static final String locationNotAvailable = "Unable to get device location";
}
