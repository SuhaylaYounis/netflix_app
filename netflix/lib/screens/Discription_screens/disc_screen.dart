import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class DiscScreen extends StatelessWidget {
  int id;
  num vote_average;
  String overview;
  String title;
  String poster_path;


  DiscScreen(
      {required this.id,
      required this.vote_average,
      required this.overview,
      required this.title,
      required this.poster_path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: [
          Image.network(image_url+poster_path,fit:BoxFit.fill),
          BackdropFilter(filter:ImageFilter.blur(
            sigmaX:5,sigmaY:5,
          ),
          child:Container(
              color: Colors.white.withOpacity(0.2),
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  width:MediaQuery.of(context).size.width ,
                  alignment: Alignment.center,
                  child: Image.network(
                    image_url+poster_path,
                    fit: BoxFit.fitWidth,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Text("$title",
                            style: TextStyle(color: white, fontSize: 30),),
                          ),
                          Expanded(
                            flex: 25,
                            child: Text("$vote_average /10",
                              style: TextStyle(color: white, fontSize: 30),),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
