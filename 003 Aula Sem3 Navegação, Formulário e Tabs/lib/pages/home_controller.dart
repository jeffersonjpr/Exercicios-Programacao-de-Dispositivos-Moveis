import '../models/items.dart';
import 'package:fluttuando/models/stats.dart';
import 'package:fluttuando/repositories/items_repository.dart';

class HomeController {
  ItemsRepository itemsRepository;

  List<Item> get tabela => itemsRepository.items;

  HomeController() {
    itemsRepository = ItemsRepository();
  }
}
