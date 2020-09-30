class SliderModel {
  String imagePath, title, description;

  SliderModel({this.imagePath, this.title, this.description});

  void setImagePath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImagePath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //First page
  sliderModel.setImagePath('lib/src/images/on_boarding_screen/plan.png');
  sliderModel.setTitle('Make Plan');
  sliderModel.setDescription('Make a perfect plan and get ready to travel.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //Second page
  sliderModel.setImagePath('lib/src/images/on_boarding_screen/bus-ticket.png');
  sliderModel.setTitle('Book Ticket');
  sliderModel.setDescription('Book your ticket with few taps from your phone from any place.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //Third page
  sliderModel.setImagePath('lib/src/images/on_boarding_screen/travel-safe.png');
  sliderModel.setTitle('Travel Safe');
  sliderModel.setDescription('Get your package ready and join us to travel safely.');
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;

}
