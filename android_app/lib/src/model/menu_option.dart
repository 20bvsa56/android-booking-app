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


