 class Movie{
  int id;
  num vote_average;
  String overview;
  String title;
  String poster_path;

  Movie(
      {required this.id,
      required this.vote_average,
      required this.overview,
      required this.title,
      required this.poster_path
      }
      );
  factory Movie.fromMap(Map<String,dynamic>map ){
    return Movie(
      id: map["id"],
      vote_average: map["vote_average"],
      title: map["title"],
      overview: map["overview"],
      poster_path: map["poster_path"],
    );
  }
  Map<String,dynamic>toMap(){
    return{
      "id":this.id,
      "vote_average":this.vote_average,
      "overview":this.overview,
      "title":this.title,
      "poster_path":this.poster_path,
    };
  }
}