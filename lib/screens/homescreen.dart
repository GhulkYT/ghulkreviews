import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ghulk/models/movie.dart';
import 'package:ghulk/services/movie_api.dart';
import 'profsrn.dart';
import 'mt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G.HULK"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, //remove this when you add image.
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfScreen()));
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('images/Default_pfp.jpg'),
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1300,
          child: Column(
            children: [
              const SizedBox(
                height: 29,
              ),
              Flexible(
                child: FutureBuilder(
                    future: MovieAPI().getTop(),
                    builder: (
                      context,
                      AsyncSnapshot snapshot,
                    ) {
                      List movielist = snapshot.data;
                      print(movielist);
                      return ListView.builder(
                        itemCount: movielist.length,
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          Movie movie = movielist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowInfo(movie)));
                            },
                            child: Container(
                              width: 200.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(movie.posterURL),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Flexible(
                child: FutureBuilder(
                    future: MovieAPI().getPop(),
                    builder: (
                      context,
                      AsyncSnapshot snapshot,
                    ) {
                      List movielist = snapshot.data;
                      print(movielist);
                      return ListView.builder(
                        itemCount: movielist.length,
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          Movie movie = movielist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowInfo(movie)));
                            },
                            child: Container(
                              width: 200.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(movie.posterURL),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Flexible(
                child: FutureBuilder(
                    future: MovieAPI().getNew(),
                    builder: (
                      context,
                      AsyncSnapshot snapshot,
                    ) {
                      List movielist = snapshot.data;
                      print(movielist);
                      return ListView.builder(
                        itemCount: movielist.length,
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          Movie movie = movielist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowInfo(movie)));
                            },
                            child: Container(
                              width: 200.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(movie.posterURL),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
              Flexible(
                child: FutureBuilder(
                    future: MovieAPI().getNow(),
                    builder: (
                      context,
                      AsyncSnapshot snapshot,
                    ) {
                      List movielist = snapshot.data;
                      print(movielist);
                      return ListView.builder(
                        itemCount: movielist.length,
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          Movie movie = movielist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowInfo(movie)));
                            },
                            child: Container(
                              width: 200.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(movie.posterURL),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
