import 'package:flutter/material.dart';
import 'package:movies/description.dart';

import '../utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              color: Colors.amber, text: 'Popular tv shows', size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: tv[index]['title'] != null
                                        ? tv[index]['title']
                                        : "loading",
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    description: tv[index]['overview'],
                                    vote: tv[index]['vote_average'].toString(),
                                    launch_on: tv[index]['release_date'] != null
                                        ? tv[index]['release_date']
                                        : "coming_soon",
                                  )));
                    },
                    child: Container(
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
                                          tv[index]['backdrop_path']),
                                )),
                          ),
                          Container(
                            child: modified_text(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'loading..',
                                color: Colors.white,
                                size: 20),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
