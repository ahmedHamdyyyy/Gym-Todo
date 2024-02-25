import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/feature/cubit/customer_cubit.dart';

import 'config/themes/themes.dart';
import 'core/services/cache/cache.dart';
import 'core/services/db/db.dart';
import 'core/services/service_locator/service_locator.dart';
import 'feature/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setApp();
  await locator<CacheServices>().init();
  await locator<DBServices>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<CustomerCubit>()
        ..getTheme()
        ..getCustomers(),
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: Themes().theme(state.theme),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
