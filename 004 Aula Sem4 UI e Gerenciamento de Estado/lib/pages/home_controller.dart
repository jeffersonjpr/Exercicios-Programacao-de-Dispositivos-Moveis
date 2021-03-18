import '../models/times.dart';
import '../repositories/times_repository.dart';

class HomeController {
  ItemsRepository itemsRepository;

  List<Time> get tabela => itemsRepository.items;

  HomeController() {
    itemsRepository = ItemsRepository();
  }
}
