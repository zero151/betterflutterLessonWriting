import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie{
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName, 
    required this.title, 
    required this.time, 
    required this.description});

}

class MovieListWidget extends StatefulWidget {


  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(imageName: Images.mkMovie, 
      id: 1,
      title: 'Mortal Kombat', 
      time: 'April 7, 2021', 
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage,'
    ),
    Movie(imageName: Images.mkMovie, 
      id: 2,
      title: 'Mortal Kombat 2', 
      time: 'April 7, 2021', 
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage,'
    ),
    Movie(imageName: Images.mkMovie, 
      id: 3, 
      title: 'Time', 
      time: 'April 7, 2021', 
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage,'
    ),
    Movie(imageName: Images.mkMovie, 
      title: 'Flutter', 
      id: 4,
      time: 'April 7, 2021', 
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage,'
    ),
    Movie(imageName: Images.mkMovie, 
      title: 'Ocean', 
      id: 5,
      time: 'April 7, 2021', 
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage,'
    ),

  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies(){
    final quary = _searchController.text;
    if(quary.isNotEmpty){
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(quary.toLowerCase());
      }).toList();
    }else{
      _filteredMovies = _movies;
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTab(int index){
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/mainScreen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 70),
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index){
            final movie = _filteredMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2)
                    )]
                    ),
                clipBehavior: Clip.hardEdge,    
                child: Row(
                  children: [
                    Image(image: AssetImage(movie.imageName)),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text(movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text(movie.time,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 20,),
                          Text(
                            movie.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => _onMovieTab(index),
                ),
              ),

            ]),
            );
        }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder()
            ),
          ),
        )
      ],
    );
  }
}