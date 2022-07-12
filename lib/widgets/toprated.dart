import 'package:flutter/material.dart';

import '../description.dart';
import '../utils/text.dart';

class Toprated extends StatelessWidget {
  final List toprated;

  const Toprated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(color: Colors.amber, text: 'Toprated Movies', size: 20),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                itemCount: toprated.length,
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
                                            toprated[index]['backdrop_path'],
                                    description: toprated[index]['overview'],
                                    launch_on: toprated[index]['release_date'],
                                    name: toprated[index]['title'],
                                    posterurl:
                                        'http://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'],
                                    vote: toprated[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 250,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'http://image.tmdb.org/t/p/w500' +
                                            toprated[index]['backdrop_path']))),
                          ),
                          Container(
                            child: modified_text(
                                text: toprated[index]['title'] ?? 'loading..',
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
