import '../../config/constants/constant.dart';
import '../../core/services/cache/cache.dart';
import '../../core/services/db/db.dart';

import '../models/customer.dart';

class AppData {
  const AppData(this._dbServices, this._cacheServices);
  final DBServices _dbServices;
  final CacheServices _cacheServices;

  bool checkTheme() => _cacheServices.shared.containsKey(Constant.theme);
  Future<bool> setTheme(int theme) async =>
      await _cacheServices.shared.setInt(Constant.theme, theme);
  int? theme() => _cacheServices.shared.getInt(Constant.theme);

  bool checkLang() => _cacheServices.shared.containsKey(Constant.lang);
  Future<bool> setLang(String lang) async =>
      await _cacheServices.shared.setString(Constant.lang, lang);
  String? lang() => _cacheServices.shared.getString(Constant.lang);

  Future<List<CustomerModel>> getCustomers() async {
    final customers = await _dbServices.db.query(Constant.customerTable);
    if (customers.isEmpty) return [];
    return customers
        .map((customer) => CustomerModel.fromMap(customer))
        .toList();
  }

  Future<CustomerModel?> getCustomer(String id) async {
    final customerList = await _dbServices.db.query(
      Constant.customerTable,
      where: '${Constant.id} = ?',
      whereArgs: [id],
    );
    if (customerList.isEmpty) return null;
    return CustomerModel.fromMap(customerList.first);
  }

  Future<int> addCustomer(CustomerModel customer) async =>
      await _dbServices.db.insert(Constant.customerTable, customer.toMap());

  Future updateCustomer(CustomerModel customer) async =>
      await _dbServices.db.update(
        Constant.customerTable,
        customer.toMap(),
        where: '${Constant.id} = ?',
        whereArgs: [customer.id],
      );

  Future<int> deleteCustomer(String id) async =>
      await _dbServices.db.delete(Constant.customerTable,
          where: '${Constant.id} = ?', whereArgs: [id]);
}
