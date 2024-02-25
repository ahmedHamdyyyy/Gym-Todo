import 'package:flutter/material.dart';

import '../../config/colors/colors.dart';
import '../../config/input_validation.dart';
import '../../core/services/service_locator/service_locator.dart';
import '../../core/utils/utils.dart';
import '../cubit/customer_cubit.dart';
import '../models/customer.dart';

Future<dynamic> showModalBottomSheetHome({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController priceController,
  required TextEditingController phoneController,
  required TextEditingController endController,
  required TextEditingController startController,
  required GlobalKey<FormState> formKey,
  required CustomerState state,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Form(
      key: formKey,
      child: SizedBox(
          width: double.infinity,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: kTextColor[state.theme]),
                  controller: nameController,
                  maxLines: 2,
                  minLines: 1,
                  validator: (value) => InputValidation.nameValidation(value),
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "Write a Name ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                 ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: kTextColor[state.theme]),
                  controller: phoneController,
                  maxLength: 11,
                  validator: (value) => InputValidation.phoneValidation(value),
                  decoration: const InputDecoration(
                    labelText: "phone",
                    hintText: "Write a phone ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                 ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: kTextColor[state.theme]),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  maxLength: 4,
                  validator: (value) => InputValidation.nameValidation(value),
                  decoration: const InputDecoration(
                    labelText: "price",
                    hintText: "Enter your price ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                 ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: kTextColor[state.theme]),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'must not be empty';
                          }
                          return null;
                        },
                        controller: startController,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        decoration: const InputDecoration(
                            labelText: "Start",
                            hintText: "Please Enter Start",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.price_change_outlined)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: kTextColor[state.theme]),
                        validator: (value) =>
                            InputValidation.nameValidation(value),
                        controller: endController,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        decoration: const InputDecoration(
                          labelText: "End",
                          hintText: " Enter end",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: Icon(Icons.discount),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    {
                      if (!formKey.currentState!.validate()) return;
                      locator<CustomerCubit>().addCustomer(CustomerModel(
                        id: Utils.id(),
                        name: nameController.text,
                        phone: phoneController.text,
                        aDate: startController.text,
                        eDate: endController.text,
                        price: priceController.text,
                      ));

                      nameController.clear();
                      phoneController.clear();
                      endController.clear();
                      startController.clear();
                      priceController.clear();

                      Navigator.pop(context);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add Note"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          )),
    ),
  );
}
