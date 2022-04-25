import 'package:loggy/loggy.dart';
import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  final _localRepository = UserLocalDataSource();
  final _remoteRepository = UserRemoteDatatasource();

  UserRepository() {
    logInfo("Starting UserRepository");
  }

  addUser(RandomUser user) {
    _localRepository.addUser(user);
  }

  Future<RandomUser> getUser() async {
    final user = await _remoteRepository.getUser();
    return user;
  }

  Future<List<RandomUser>> getAllUsers() async =>
      _localRepository.getAllUsers();

  Future<void> deleteUser(id) async => _localRepository.deleteUser(id);

  Future<void> deleteAll() async => _localRepository.deleteAll();

  Future<void> updateUser(user) async => _localRepository.updateUser(user);
}
