
import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/barcode/data/barcode_provider.dart';


abstract class IBarcodeRepository {

}

class BarcodeRepository extends BaseRepository implements IBarcodeRepository {
  BarcodeRepository({required this.provider});
  final BarcodeProvider provider;


}
