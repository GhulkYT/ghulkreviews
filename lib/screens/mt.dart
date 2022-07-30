import 'package:flutter/material.dart';
import 'package:ghulk/models/comments.dart';
import 'package:ghulk/services/auth.dart';
import 'package:ghulk/services/database.dart';

import '../models/movie.dart';
import 'profsrn.dart';

class ShowInfo extends StatefulWidget {
  Movie movie;
  ShowInfo(this.movie);

  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
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
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.movie.posterURL),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 500,
              width: double.infinity,
              color: Colors.orange,
              child: DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 20,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.teal,
                    title: const TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Info",
                        ),
                        Tab(
                          text: "Critics",
                        )
                      ],
                    ),
                  ),
                  body: Container(
                    color: Colors.teal,
                    child: TabBarView(
                      children: [
                        ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                color: Colors.teal,
                                width: 50,
                                height: 500,
                                child: SizedBox(
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.movie.title}: ${widget.movie.overview}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                color: Colors.blue,
                                width: 500,
                                height: 500,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            color: Colors.red,
                                            width: 50,
                                            height: 50,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  text = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(16.0),
                                            primary: Colors.white,
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () async {
                                            print(text);
                                            await Database().postCommentToMovie(
                                                text,
                                                AuthenticationController()
                                                    .currentUser!
                                                    .displayName,
                                                widget.movie.id);
                                          },
                                          child: Text('Send'),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 410,
                                      width: 500,
                                      child: FutureBuilder(
                                          future: Database().getCommentsToMovie(
                                              widget.movie.id),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            List<Comment> comments =
                                                snapshot.data;
                                            return ListView.builder(
                                                itemCount: comments.length,
                                                itemBuilder: ((context, index) {
                                                  Comment comment =
                                                      comments[index];
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20),
                                                        child: Text(
                                                          comment.text,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }));
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
