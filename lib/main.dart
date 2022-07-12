import 'package:flutter/material.dart';
import 'package:movies/utils/text.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/trendingdart.dart';
import 'package:movies/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'c164bbe38b2dc7a1e1e942024cd351ad';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTY0YmJlMzhiMmRjN2ExZTFlOTQyMDI0Y2QzNTFhZCIsInN1YiI6IjYyYzJhNTVmOTY3MmVkMjNjZWZlZTlmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vJcPdrfAa_Lmgnlm0PPa10rqaBJ4fTJUVDEr5QqMw3Q';

  @override
  void initState() {
    loadmovies();

    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresult);
    print(topratedresult);
    print(tvresult);

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: modified_text(
              color: Colors.amber, text: 'Flutter movie app ❤️', size: 20),
        ),
        body: ListView(
          children: [
            Trendingmovies(trending: trendingmovies),
            Toprated(toprated: topratedmovies),
            TV(tv: tv),
          ],
        ));
  }
}
