import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthify_us/modal/healthy_recipe_modal.dart';

import 'package:http/http.dart' as http;

class HealthyController extends ChangeNotifier {
  List<AllPosts>? _getPost;

  List<AllPosts>? get getPost => _getPost;

  HealthyRecipe? recipe;

  void gethealthyData() async {
    try {
      var value = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/healthy_recipes/healthy_recipes_all_data"));

      if (value.statusCode == 200) {
        recipe = HealthyRecipe.fromJson(jsonDecode(value.body));

        _getPost = List.from(recipe!.allPosts!);

        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
