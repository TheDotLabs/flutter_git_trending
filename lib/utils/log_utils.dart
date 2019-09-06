bool get isDebug {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

/// Prints a string representation of the object to the console.
///
/// Prints only in 'debug' mode
printLog(dynamic o, {bool upload = false, StackTrace stackTrace}) {
  if (isDebug) {
    print(o.toString() ?? "");
    if (stackTrace != null) print(stackTrace);
  }
}
