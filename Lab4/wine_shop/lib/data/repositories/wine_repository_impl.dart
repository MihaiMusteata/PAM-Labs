import '../../domain/models/wine_data.dart';
import '../datasource/wine_data_source.dart';

class WineRepositoryImpl {
  final WineDataSource dataSource;

  WineRepositoryImpl(this.dataSource);

  Future<WineData> getWineData() {
    return dataSource.loadWineData();
  }
}
