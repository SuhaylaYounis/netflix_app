import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:netflix/controller/get_popular.dart';
import 'package:netflix/controller/get_top_rated.dart';
import '../../constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Netflix",
          style: TextStyle(
            color: red,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              color: red,
              size: 24,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Consumer(
            builder: (BuildContext context, watch, child) {
              var viewModelTopRate = watch(getdatatoprate);
              return CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.9,
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: viewModelTopRate.listDataModel.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GridTile(
                    child: Image.network(
                        image_url +
                            viewModelTopRate.listDataModel[index].poster_path,
                        fit: BoxFit.cover),
                    footer: Container(
                      color: Colors.red.withOpacity(0.5),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        viewModelTopRate.listDataModel[index].title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Expanded(
            child: Consumer(
              builder: (BuildContext context,
                  T Function<T>(ProviderBase<Object?, T>) watch,
                  Widget? child) {
                var viewModelPopular = watch(getdatapopular);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount:viewModelPopular.listDataModel.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: () {
                            print("url");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(image_url +
                                      viewModelPopular.listDataModel[index].poster_path,
                                      fit: BoxFit.cover),
                                  Container(
                                    color: black,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${viewModelPopular.listDataModel[index].title }",
                                          style:TextStyle(color:Colors.white) ,
                                          ),
                                        ),
                                        Text("${viewModelPopular.listDataModel[index].overview}",
                                          maxLines: 2,
                                            style:TextStyle(color:Colors.white) ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (int index)=>new StaggeredTile.fit(1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
