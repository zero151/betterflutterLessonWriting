import 'package:flutter/material.dart';
import 'package:themoviedb/widget/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index){
    setState(() {
      if(_selectedTab == index) return;
      _selectedTab  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('Новости'),
          MovieListWidget(),
          Text('Сериалы'),],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Новости'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Фильмы'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: 'Сериалы'
          ),
      ],
      onTap: onSelectTab,
      ),
    );
  }
}