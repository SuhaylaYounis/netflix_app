import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:netflix/controller/get_popular.dart';
import 'package:netflix/controller/get_top_rated.dart';
import 'package:netflix/screens/Discription_screens/disc_screen.dart';
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
            fontWeight: FontWeight.bold,
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
              return (viewModelTopRate.listDataModel.length==0)?SizedBox(height: 0 ,): CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 0.8,
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: true,
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
                        fit: BoxFit.fill),
                    footer: Container(
                      color: Colors.red.withOpacity(0.8),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        viewModelTopRate.listDataModel[index].title.toString(),
                          textAlign:TextAlign.center,
                        style: TextStyle(color: Colors.white,
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
                              Navigator.push(context,MaterialPageRoute(builder:(BuildContext context){
                              return DiscScreen(
                              title: viewModelPopular.listDataModel[index]
                                  .title, overview:viewModelPopular.listDataModel[index].overview ,
                                vote_average: viewModelPopular.listDataModel[index].vote_average,
                                  id:viewModelPopular.listDataModel[index].id,
                                  poster_path:viewModelPopular.listDataModel[index].poster_path,

                              );
                              }));


                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                                color: black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: red, width: 1), ),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(image_url +
                                      viewModelPopular.listDataModel[index].poster_path,
                                      fit: BoxFit.contain),
                                  Container(
                                    color: black,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${viewModelPopular.listDataModel[index].title }",
                                          style:TextStyle(color:Colors.white) ,textAlign: TextAlign.center
                                          ),
                                        ),
                                        /*  Container(
                                          padding: EdgeInsets.all(5),
                                          color:black,
                                          alignment:Alignment.center,

                                         child: Text("${viewModelPopular.listDataModel[index].overview}",
                                            maxLines: 1,
                                              style:TextStyle(color:Colors.white),
                                          textAlign: TextAlign.center ,
                                          ),
                                        ),*/
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
