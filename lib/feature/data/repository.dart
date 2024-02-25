import '../models/customer.dart';
import 'data.dart';

class AppRepository {
  const AppRepository(this._data);
  final AppData _data;

  int theme() => _data.checkTheme() ? _data.theme() ?? 0 : 0;
  Future setTheme(
    int theme,
  ) async =>
      await _data.setTheme(theme) ? null : throw Exception("locale.failed");

  String lang() => _data.checkLang() ? _data.lang() ?? 'en' : 'en';
  Future setLang(
    String lang,
  ) async =>
      await _data.setLang(lang) ? null : throw Exception("locale.failed");

  Future<List<CustomerModel>> getCustomers() async =>
      await _data.getCustomers();

  Future addCustomer(
    CustomerModel customer,
  ) async =>
      await _data.addCustomer(customer) == 0
          ? throw Exception("locale.failed")
          : null;

  Future updateCustomer(CustomerModel customer) async =>
      await _data.updateCustomer(customer);

  Future deleteCustomer(
    String id,
  ) async =>
      await _data.deleteCustomer(id) == 0
          ? throw Exception("locale.failed")
          : null;

  Future<CustomerModel> getCustomer(String id) async {
    final customer = await _data.getCustomer(id);
    if (customer == null) {
      throw Exception("customer is null");
    } else {
      return customer;
    }
  }
}
