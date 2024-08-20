import 'dart:convert';

import 'package:appscrip_task/constans/sersearchparm.dart';
import 'package:appscrip_task/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../repositry/user_repositry.dart';


final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

final userListProvider = FutureProvider.family((ref,String search) => ref.watch(userServiceProvider).fetchUsers(search));