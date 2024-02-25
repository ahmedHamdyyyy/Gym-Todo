import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/services/service_locator/service_locator.dart';
import '../cubit/customer_cubit.dart';
import '../screens/update_screen.dart';

// ignore: must_be_immutable
class ListViewSearchUser extends StatelessWidget {
  ListViewSearchUser({
    super.key,
    required this.state,
  });
  CustomerState state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
            bottom: 5, left: 10, right: 10),
        child: FadeInUp(
        duration: const Duration(milliseconds: 1000),
    child: Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateScreen(
                                          id: state
                                              .searchList[
                                          index]
                                              .id),
                                ));
                          },
                          child: Text(
                            state
                                .searchList[index].name,
                            style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      onPressed: () {

                        locator<CustomerCubit>()
                            .deleteCustomer(state.searchList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            ]),
      ),
    )),
      ),
      itemCount: state.searchList.length,
    );
  }
}
