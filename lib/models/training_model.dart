class TrainingModel {
  final int id;
  final String title;
  final String time;
  final String trainerName;
  final String date;
  final String location;
  final String image;
  final String trainerProfile;
  final String price;
  final bool isFillingFast;
  final bool isEarlyBird;

  TrainingModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.trainerName,
    required this.location,
    required this.trainerProfile,
    required this.image,
    required this.price,
    required this.isFillingFast,
    required this.isEarlyBird,
  });
}
