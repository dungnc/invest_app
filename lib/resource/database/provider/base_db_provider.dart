abstract class BaseDBProvider<T>{
  Future init();
  Future createTable();
  Future update(T value, String id);
  Future<List<int>> insert(List<Map<String, Object?>> value, String createdAt);
  Future delete(int id);
  Future<List<Map>> selectAll();
  Future<Map> selectOne(int id);
}