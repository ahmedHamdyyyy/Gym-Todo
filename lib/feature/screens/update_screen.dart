import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym/config/constants/constant.dart';
import 'package:gym/feature/Widget/toust.dart';

import '../../config/colors/colors.dart';
import '../../config/input_validation.dart';
import '../../core/services/service_locator/service_locator.dart';
import '../cubit/customer_cubit.dart';
import '../models/customer.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key, required this.id,});
  String id;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    locator<CustomerCubit>().getCustomer(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final priceController = TextEditingController();
    final eDateController = TextEditingController();
    final aDateController = TextEditingController();
    return BlocConsumer<CustomerCubit, CustomerState>(
      listener: (context, state) {
        if(state.updateCustomersState==Status.success){
          showToast(text: state.msg, state: ToutsState.SUCCESS);
        }
      },
      listenWhen: (previous, current) => previous.updateCustomersState !=current.updateCustomersState,
      buildWhen: (previous, current) => previous.customer !=current.customer,


      builder: (context, state) {
        nameController.text = state.customer.name;
        priceController.text = state.customer.price;
        phoneController.text = state.customer.phone;
        aDateController.text = state.customer.aDate;
        eDateController.text = state.customer.eDate;
        return Scaffold(
          appBar: AppBar(
            actions: [Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.customer.name,style: const TextStyle(
                fontSize: 16
              ),),
            )],
            elevation: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FadeInUp(
        duration:  const Duration(milliseconds: 1000),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  TextFormField(
                    style: TextStyle(color: kTextColor[state.theme]),
                    controller: nameController,
                    maxLines: 1,
                    validator: (value) => InputValidation.nameValidation(value),
                    decoration: const InputDecoration(
                      labelText: "name",
                      hintText: "Write your name ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    style: TextStyle(color: kTextColor[state.theme]),
                    maxLength: 3,
                    validator: (value) => InputValidation.nameValidation(value),
                    decoration: const InputDecoration(
                      labelText: "price",
                      hintText: "Enter price ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => InputValidation.phoneValidation(value),
                    controller: phoneController,
                    maxLength: 11,
                    style: TextStyle(color: kTextColor[state.theme]),
                    decoration: const InputDecoration(
                      labelText: "phone",
                      hintText: "Please Enter phone",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: kTextColor[state.theme]),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'must not be empty';
                      }
                      return null;
                    },
                    controller: aDateController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      labelText: "First date",
                      hintText: "Please Enter date",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  TextFormField(
                    validator: (value) => InputValidation.nameValidation(value),
                    controller: eDateController,
                    style: TextStyle(color: kTextColor[state.theme]),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      labelText: "End date",
                      hintText: " Enter End date ",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
            FadeInUp(
              duration:  const Duration(milliseconds: 2000),
                    child: ElevatedButton(
                      onPressed: () async {
                        {
                          locator<CustomerCubit>().updateCustomer(CustomerModel(
                              id: state.customer.id,
                              name: nameController.text,
                              phone: phoneController.text,
                              aDate: aDateController.text,
                              eDate: eDateController.text,
                              price: priceController.text));
                        }
                      },
                      child: state.updateCustomersState==Status.loading?const Center(child:  CircularProgressIndicator()): Text("Update"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
