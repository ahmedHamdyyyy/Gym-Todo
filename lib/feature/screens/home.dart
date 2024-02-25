// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gym/core/services/service_locator/service_locator.dart';
import 'package:gym/feature/cubit/customer_cubit.dart';
import '../../config/colors/colors.dart';
import '../Widget/show_modal_bottom_sheet_home.dart';
import '../Widget/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocProvider.value(
          value: locator<CustomerCubit>()
            ..getCustomers(),
          child: Scaffold(
            appBar: AppBar(

              elevation: 20,
              title: const Text('gym Golden'),
            ),
            body: Center(
              child: widgetOptions[_selectedIndex],
            ),
            bottomNavigationBar: BlocBuilder<CustomerCubit, CustomerState>(
              builder: (context, state) {
                return Container(
                  decoration: buildBoxDecoration(state),
                  child: SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15.0,
                          vertical: 8),
                      child: GNav(

                        gap: 12,
                        activeColor: Colors.white,
                        iconSize: 25,

                       // backgroundColor: foreGroundColor[state.theme],
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        duration: const Duration(milliseconds: 400),
                        tabBackgroundColor: gButtonColor[state.theme],
                        color: kColorIcon[state.theme],
                        tabs: const [
                          GButton(
                            icon: Icons.home,
                            text: 'Home',
                          ),

                          GButton(
                            icon: Icons.search,
                            text: 'Search',
                          ),
                          GButton(
                            icon: Icons.dark_mode_outlined,
                            text: 'Mood',
                          ),
                        ],
                        selectedIndex: _selectedIndex,
                        onTabChange: (index) {
                          setState(() {});
                          _selectedIndex = index;
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: buildBlocBuilderFloatingActionButton(),
          )),
    );
  }


  BlocBuilder<CustomerCubit, CustomerState> buildBlocBuilderFloatingActionButton() {
    return BlocBuilder<CustomerCubit
    ,
        CustomerState>(
      builder: (context, state) {
        return FloatingActionButton(
          child: const Icon(
            Icons.person_add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheetHome(
                state: state,
                context: context,
                endController: endController,
                formKey: formKey,
                nameController: nameController,
                phoneController: phoneController,
                priceController: priceController,
                startController: startController);
          },
        );
      },
    );
  }

}
