import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/service_locator/service_locator.dart';
import '../Widget/list_view_search_user.dart';
import '../cubit/customer_cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<CustomerCubit>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CustomerCubit, CustomerState>(

            builder: (context, state) {
              return ListView(
                primary: false,
                children: [
              FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            locator<CustomerCubit>().clearListState();
                            controller.clear();
                          },
                          icon: const Icon(Icons.close),
                          color: Colors.red),
                      labelText: "search",
                      hintText: "search for user ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onChanged: (value) =>
                        locator<CustomerCubit>().searchFunction(value),
                  ),
                ),
              ) ),
                  state.searchList.isNotEmpty
                      ? ListViewSearchUser(
                          state: state,
                        )
                      : FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                              ),
                              Center(child: Text("No user exists")),
                            ],
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
