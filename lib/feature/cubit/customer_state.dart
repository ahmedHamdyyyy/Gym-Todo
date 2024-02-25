part of 'customer_cubit.dart';

class CustomerState extends Equatable {
  final String msg;
  final int theme;
  final Status addCustomerState;
  final Status themeStatus;
  final Status deleteCustomerState;
  final Status getAllCustomersState;
  final Status updateCustomersState;
  final Status getCustomersState;

  final CustomerModel customer;
  final List<CustomerModel> customers;
  final List<CustomerModel> searchList;

  const CustomerState({
    this.msg = "",
    this.theme=0,
    this.addCustomerState = Status.initial,
    this.themeStatus = Status.initial,
    this.deleteCustomerState = Status.initial,
    this.getAllCustomersState = Status.initial,
    this.updateCustomersState = Status.initial,
    this.getCustomersState = Status.initial,
    this.customer = CustomerModel.initial,
    this.customers = const [],
    this.searchList = const [],
  });
  CustomerState copyWith({
    String? msg,
    int? theme,
    Status? addCustomerState,
    Status? deleteCustomerState,
    Status? themeStatus,
    Status? getAllCustomersState,
    Status? updateCustomersState,
    Status? getCustomersState,
    CustomerModel? customer,
    List<CustomerModel>? customers,
    List<CustomerModel>? searchList,
  }) {
    return CustomerState(
      customer: customer ?? this.customer,
      customers: customers ?? this.customers,
      msg: msg ?? this.msg,
      theme: theme ?? this.theme,
      updateCustomersState: updateCustomersState ?? this.updateCustomersState,
      addCustomerState: addCustomerState ?? this.addCustomerState,
      deleteCustomerState: deleteCustomerState ?? this.deleteCustomerState,
      getAllCustomersState: getAllCustomersState ?? this.getAllCustomersState,
      getCustomersState: getCustomersState ?? this.getCustomersState,
      searchList: searchList ?? this.searchList,
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }

  @override
  List<Object> get props => [
        msg,
    theme,
    themeStatus,        addCustomerState,
        deleteCustomerState,
        getAllCustomersState,
        updateCustomersState,
        getCustomersState,
    searchList,
        customer,
        customers,
      ];
}
