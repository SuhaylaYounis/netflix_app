import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:netflix/model/Movie.dart';
final getdatatoprate=ChangeNotifierProvider.autoDispose<GetTopRated>((ref)=>GetTopRated());
class GetTopRated extends ChangeNotifier{
  List<Movie>listDataModel=[];
  GetTopRated(){
    getData();
  }
  Future getData()async{
    try{
      String apiKey="f476c933beeb792de073665402a501ad";
    var url=Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1c");
   print(url);
   var response= await http.get(url);
   var responsebody=jsonDecode(response.body)["results"];
   print("responsebody$responsebody");
   for(int i=0; i<responsebody.length;i++){
     listDataModel.add(Movie.fromMap(responsebody[i]));
   }
    }
    catch(e){
      print("e=>$e");
    }
    notifyListeners();
  }
}