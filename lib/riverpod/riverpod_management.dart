import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waitech/riverpod/login_riverpod.dart';
import 'package:waitech/riverpod/signup_riverpod.dart';



final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final signUpRiverpod = ChangeNotifierProvider((_) => SignUpRiverpod());

