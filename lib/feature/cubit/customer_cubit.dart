import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gym/config/constants/constant.dart';
import 'package:gym/feature/models/customer.dart';

import '../../core/error/error_handler.dart';
import '../data/repository.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this._errorHandler, this._repo) : super(const CustomerState());

  final ErrorHandler _errorHandler;
  final AppRepository _repo;


  void setTheme(int theme) async {
    try {
      emit(state.copyWith(themeStatus: Status.loading));
      final themeResponse = theme == 0 ? 1 : 0;
      await _repo.setTheme(themeResponse);
      emit(state.copyWith(theme: themeResponse,
          themeStatus: Status.success));
   
    } catch (e) {
      emit(state.copyWith(themeStatus: Status.failure, msg: e.toString()));
    }
  }

  void getTheme() {
    emit(state.copyWith(themeStatus: Status.loading));
    final theme = _repo.theme();
    emit(state.copyWith(theme: theme, themeStatus: Status.success));
  }
  void getCustomers() async {
    try {
      emit(state.copyWith(getAllCustomersState: Status.loading));
      final customers = _errorHandler.handle(
        await _repo.getCustomers(),
      );
      await Future.delayed(const Duration(milliseconds: 50));
      emit(state.copyWith(
        customers: customers,
        getAllCustomersState: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
          getAllCustomersState: Status.failure, msg: e.toString()));
    }
  }

  void addCustomer(
    CustomerModel customer,
  ) async {
    try {
      emit(state.copyWith(addCustomerState: Status.loading));
      _errorHandler.handle(
        await _repo.addCustomer(
          customer,
        ),
      );

      emit(state.copyWith(
        msg: "Add user successful",
          addCustomerState: Status.success,
          customers: List.from(state.customers)..add(customer)));
    } catch (e) {
      emit(state.copyWith(addCustomerState: Status.failure));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void getCustomer(String id) async {
    emit(state.copyWith(getCustomersState: Status.loading));

    try {
      final customer = await _repo.getCustomer(id);
      emit(state.copyWith(
          getCustomersState: Status.success, customer: customer));
    } catch (e) {
      emit(state.copyWith(getCustomersState: Status.failure));
    }
  }

  void updateCustomer(
    CustomerModel customer,
  ) async {
    try {
      emit(state.copyWith(updateCustomersState: Status.loading));
      _errorHandler.handle(
        await _repo.updateCustomer(customer),
      );
      final index = state.customers.indexWhere((e) => e.id == customer.id);
      emit(state.copyWith(
          customers: List.from(state.customers)..[index] = customer,
          updateCustomersState: Status.success,msg: "update User Success "));
    } catch (e) {
      emit(state.copyWith(
          updateCustomersState: Status.failure, msg: e.toString()));
    }
  }

  void deleteCustomer(
    String id,
  ) async {
    try {
      emit(state.copyWith(deleteCustomerState: Status.loading));

      _errorHandler.handle(
        await _repo.deleteCustomer(
          id,
        ),
      );

      emit(state.copyWith(
          deleteCustomerState: Status.success,
          customers: List.from(state.customers)
            ..removeWhere((customer) => customer.id == id),msg: "delete successfully"));
    } catch (e) {
      emit(state.copyWith(deleteCustomerState: Status.failure));
    }
  }

  void clearListState() {
    emit(state.copyWith(searchList: []));
  }

  void searchFunction(String name) {
    List<CustomerModel> searchNote = [];
    try {
      searchNote = state.customers
          .where((element) => element.name.contains(name))
          .toList();
      emit(state.copyWith(
        searchList: searchNote,
      ));
    } catch (e) {
      emit(state.copyWith(searchList: [], ));
    }
  }



}
