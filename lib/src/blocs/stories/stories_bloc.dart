import 'package:pics/src/models/item_model.dart';
import 'package:pics/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';


class StoriesBloc {

  final _repository = Repository();
  final _topNewsIDs = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();

  PublishSubject get topNewsIDs => _topNewsIDs;
  PublishSubject<Map<int, Future<ItemModel>>> items;
  Function(int) get fetchItem => _items.sink.add;


  StoriesBloc() {
    items = _items.stream.transform(_itemsTransformer());
  }

  fetchTopNews()async {
    final newsIDs = await _repository.fetchTopNews();
    _topNewsIDs.sink.add(newsIDs);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, _){
        cache[id] = _repository.fetchNews(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }


  dispose() {
    _topNewsIDs.close();
    _items.close();
  }


}