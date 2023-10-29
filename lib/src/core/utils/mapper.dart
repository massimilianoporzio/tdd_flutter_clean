abstract class DataMapper<T, M> {
  T mapToEntity(M model);
  M mapToModel(T entity);
}
