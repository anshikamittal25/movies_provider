import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/viewmodels.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<MovieViewModel> _list = [];

  Future<void> prepare() async {
    _list = await Provider.of<MoviesListViewModel>(context,listen: false).fetchMovies('batman');
  }

  @override
  void initState() {
    super.initState();
    prepare();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MoviesListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _textEditingController,
              onSubmitted: (value) async {
                if (value.isNotEmpty) {
                      _list = await vm.fetchMovies(value);
                  _textEditingController.clear();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(backgroundImage: NetworkImage(_list[index].poster)),
                    ),
                    Expanded(child: Text(_list[index].title)),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
