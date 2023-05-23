


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthproject/model/berita_model.dart';
import 'package:http/http.dart' as http;

class BeritaProvider with ChangeNotifier{
  List<BeritaModel> berita = [];

  Future<void> fetchberita() async{
    final url = "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=6ab64e02a26f4baf930c0127112490fe";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final jsondasta = json.decode(response.body);
      berita = (jsondasta['articles'] as List).map((data) => BeritaModel(
        author: data['author'] ?? '',
        date: data['publishedAt'] ?? '',
        urlberita: data['url'] ?? '',
        deskripsi: data['description'] ?? '',
        urlgambar: data['urlToImage'] ?? '',
        konten: data['content'] ?? '',
        title: data['title'] ?? '')).toList();
      notifyListeners();
    }else{
      throw Exception('Failed get data');
    }
  }
}