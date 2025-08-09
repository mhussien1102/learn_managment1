class TeacherModel {
  final String name;
  final String image; // asset path
  final String specialist;
  final String description;
  final String? facebookUrl;

  const TeacherModel({
    required this.name,
    required this.image,
    required this.specialist,
    required this.description,
    this.facebookUrl = "www.google.com",
  });
}
