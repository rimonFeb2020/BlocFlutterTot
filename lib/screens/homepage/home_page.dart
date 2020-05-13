import 'package:flutter/material.dart';
import 'package:flutterbloclearingapp/repos/API.dart';
import 'package:flutterbloclearingapp/screens/homepage/homeBloc.dart';
import 'package:flutterbloclearingapp/screens/homepage/homeProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProviderBloc = HomeProvider.of(context);

    return HomeProvider(
      homeBloc: HomeBloc(API()),
      child: MaterialApp(
        theme: ThemeData(),
        home: new Scaffold(
          appBar: AppBar(
            title: Text('Bloc Example'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: homeProviderBloc.query.add,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search for a Movie',
                  ),
                ),
              ),
              StreamBuilder(
                stream: homeProviderBloc.log,
                builder: (context, snapshot) => Container(
                  child: Text(snapshot?.data ?? ''),
                ),
              ),
              Flexible(
                child: StreamBuilder(
                  stream: homeProviderBloc.results,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w92" +
                                      snapshot.data[index].posterPath ??
                                  ""),
                        ),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].overview),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: homeBloc.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a Movie',
              ),
            ),
          ),
          StreamBuilder(
            stream: homeBloc.log,
            builder: (context, snapshot) => Container(
              child: Text(snapshot?.data ?? ''),
            ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: homeBloc.results,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w92" +
                              snapshot.data[index].posterPath ??
                              ""),
                    ),
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].overview),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );*/
  }
}
