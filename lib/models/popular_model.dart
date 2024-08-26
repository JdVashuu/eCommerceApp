class popularModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool boxIsSelected;

  popularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxIsSelected,
  });

  static List<popularModel> getPopular(){
    List<popularModel> popularDiets = [];

    popularDiets.add(
      popularModel(
          name: 'Blueberry Pancake',
          iconPath: 'assets/icons/blueberry-pancake.svg',
          level: 'medium',
          duration: '20 mins',
          boxIsSelected: true,
          calories: '150kCal'
      )
    );

    popularDiets.add(
        popularModel(
          name: 'Salmon Nigiri',
          iconPath: 'assets/icons/salmon-nigiri.svg',
          level: 'Easy',
          duration: '20mins',
          calories: '120kCal',
          boxIsSelected: false,
        )
    );

    return popularDiets;
  }
}