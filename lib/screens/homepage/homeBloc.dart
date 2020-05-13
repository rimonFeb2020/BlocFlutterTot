import 'package:flutterbloclearingapp/model/homePage/Movie.dart';
import 'package:flutterbloclearingapp/repos/API.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  final API api;

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();
  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;

  HomeBloc(this.api){
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();

    _log = Stream.castFrom(results)
            .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
            .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }

}