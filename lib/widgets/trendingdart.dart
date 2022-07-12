import 'package:flutter/material.dart';
import 'package:movies/description.dart';

import '../utils/text.dart';

class Trendingmovies extends StatelessWidget {
  final List trending;

  const Trendingmovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
              color: Colors.amber, text: 'Trending movies', size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    bannerurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    description: trending[index]['overview'],
                                    launch_on: trending[index]['release_date'],
                                    name: trending[index]['title'],
                                    posterurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: trending[index]['title'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 250,
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              // ignore: prefer_interpolation_to_compose_strings
                                              'http://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['backdrop_path']))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: modified_text(
                                      text: trending[index]['title'] ??
                                          'loading..',
                                      color: Colors.white,
                                      size: 20),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
