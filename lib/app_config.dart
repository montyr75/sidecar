import 'package:flutter/foundation.dart';

import 'services/logger_service.dart';

// app info
const appName = "sidecar";
const version = "0.0.1";
const debugMode = !kReleaseMode;

// create logger
final log = LoggerService(appName: appName, debugMode: debugMode);
