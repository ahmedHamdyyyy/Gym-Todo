import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gym/feature/Widget/widget.dart';
import '../cubit/customer_cubit.dart';
// ignore: must_be_immutable
class CartNote extends StatelessWidget {
  CartNote({super.key, required this.state, required this.index});
  CustomerState state;
  int index;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        duration:  const Duration(milliseconds: 1000),
      child: Card(
        elevation: 5,
        clipBehavior : Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const SizedBox(
                  width: 18,
                ),
                buildExpandedInfoText(context,state,index),
                const SizedBox(
                  height: 20,
                ),
                buildIconButtonDelete(state,index),
              ],
            ),
            spacer(),
            buildTextEnd(state,index),
            const SizedBox(
              width: 25,
            ),
          ]),
        ),
      ),
    );
  }









}


