//
// Generated file. Do not edit.
//
import 'dart:ui';

import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(PluginRegistry registry) {
  FirebaseAuthWeb.registerWith(registry.registrarFor(FirebaseAuthWeb));
  GoogleSignInPlugin.registerWith(registry.registrarFor(GoogleSignInPlugin));
  registry.registerMessageHandler();
}
