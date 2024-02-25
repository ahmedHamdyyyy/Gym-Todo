import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/service_locator/service_locator.dart';
import '../cubit/customer_cubit.dart';

class ModeAppScreen extends StatelessWidget {
  const ModeAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCubit, CustomerState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              locator<CustomerCubit>().setTheme(state.theme);
            },
            icon: const Icon(
              Icons.light_mode,
              color: Colors.amber,
              size: 80,
            ));
      },
    );
  }
}
