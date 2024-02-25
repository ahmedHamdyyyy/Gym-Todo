import 'package:flutter/material.dart';

import '../../config/colors/colors.dart';
import '../../core/services/service_locator/service_locator.dart';
import '../cubit/customer_cubit.dart';
import '../screens/mode_screen.dart';
import '../screens/note_screen.dart';
import '../screens/search_screen.dart';
import '../screens/update_screen.dart';

BoxDecoration buildBoxDecoration(CustomerState state) {
  return BoxDecoration(
    color: backGroundColor[state.theme],
    boxShadow: [
      BoxShadow(
        blurRadius: 20,
        color: backGroundColorButtom[state.theme],
      )
    ],
  );
}

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black);

List<Widget> widgetOptions = <Widget>[
  const NoteScreen(),
  SearchScreen(),
  const ModeAppScreen(),
];

Text buildTextEnd(CustomerState state, int index) {
  return Text(
    "    end: ${state.customers[index].eDate}",
    style: const TextStyle(
        height: 1.2,
        fontWeight: FontWeight.w700,
        fontSize: 14,
       ),
  );
}

Padding spacer() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 15,
    ),
    child: Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    ),
  );
}

IconButton buildIconButtonDelete(CustomerState state, int index) {
  return IconButton(
      onPressed: () {
        locator<CustomerCubit>().deleteCustomer(state.customers[index].id);
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ));
}

Expanded buildExpandedInfoText(
    BuildContext context, CustomerState state, int index) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UpdateScreen(id: state.customers[index].id),
                ));
          },
          child: Text(
            state.customers[index].name,
            style:  TextStyle(
                color: primaryColor3[state.theme], fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "start: ${state.customers[index].aDate}",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Column noUserTextSearch() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 200,
      ),
      Center(child: Text("No user exists")),
    ],
  );
}
