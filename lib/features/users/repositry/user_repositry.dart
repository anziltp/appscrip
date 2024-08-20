import 'dart:convert';
import 'dart:developer';

import 'package:appscrip_task/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart'as http;


final UserRepositryprovider=Provider((ref) => UserService(),);

class UserService {
  Future<List> fetchUsers(String search) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
     var datas= data.map((json) => UserModel.fromJson(json)).toList();
      List <UserModel>userList = [];
//
      bool loading = true;


        loading = true;
if(search==''){
  return datas;
}
else {
  for (var docs in data) {
    if (search == '') {
      userList.add(UserModel.fromJson(docs));
    } else {
      UserModel user = UserModel.fromJson(docs);

      if (user.name.toUpperCase().contains(search.toUpperCase())) {
        userList.add(user);
      }
    }
  }

  return userList;
}
    }
    else {
      throw Exception('Failed to load users');
    }
  }

    }


