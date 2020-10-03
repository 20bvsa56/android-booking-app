class MenuOptionMOdel {
  String options;

  MenuOptionMOdel({this.options});

  void setOption(String getOption) {
    options = getOption;
  }

  String getOption() {
    return options;
  }
}

List<MenuOptionMOdel> getMenuOptions() {
  List<MenuOptionMOdel> optionsModel = new List<MenuOptionMOdel>();

  MenuOptionMOdel optionModel = new MenuOptionMOdel();

  //First Menu
  optionModel.setOption('Home');
  optionsModel.add(optionModel);

  //Second Menu
  optionModel = new MenuOptionMOdel();

  optionModel.setOption('Tickets');
  optionsModel.add(optionModel);

  //Third Menu
  optionModel = new MenuOptionMOdel();

  optionModel.setOption('Account');
  optionsModel.add(optionModel);

  return optionsModel;
}


// class MenuOptionView extends StatelessWidget {
//   final String options;
//   const MenuOptionView({Key key, this.options}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: ListTile(
//         title: Text(
//           options,
//           style: TextStyle(fontSize: 20, color: Colors.black),
//         ),
//         leading: Icon(Icons.home, size: 26, color: Color(0xfff2a407)),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => HomePage()),
//           );
//         },
//       ),
//     );
//   }
// }



//   ListView.builder(
//           itemCount: optionsModel.length,
//           itemBuilder: (context, index) {
//             return MenuOptionView(
//               options: optionsModel[index].getOption(),
//             );
//           }),
