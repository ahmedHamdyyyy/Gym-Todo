import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../config/constants/constant.dart';
import '../../core/services/service_locator/service_locator.dart';
import '../Widget/cart_note.dart';
import '../Widget/no_user_add.dart';
import '../Widget/toust.dart';
import '../cubit/customer_cubit.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
      listenWhen:(previous, current) => previous.deleteCustomerState !=current.deleteCustomerState
,
      listener: (context, state) {
        if(state.deleteCustomerState==Status.success) {
       return   showToast(text: state.msg, state: ToutsState.SUCCESS);
        }

      },
      buildWhen: (previous, current) => previous.customers != current.customers,
      builder: (context, state) {
        return state.customers.isNotEmpty?ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 2,
                left: 10,
                right: 10,
              ),
              child: Dismissible(
                  direction: DismissDirection.horizontal,
                  key: Key(state.customers[index].id),
                  onDismissed: (direction) => locator<CustomerCubit>()
                      .deleteCustomer(state.customers[index].id),
                  child: CartNote(index: index, state: state)),
            );
          },
          itemCount: state.customers.length,
        ):
         const NoUserAdd()
        ;
      },
    );
  }
}


