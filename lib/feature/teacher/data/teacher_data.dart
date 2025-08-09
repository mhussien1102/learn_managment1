import 'package:learn_managment1/core/model/teacher_model.dart';
import 'package:learn_managment1/core/utils/assets.dart';

/// Dummy/local data. Swap with API later.
const List<TeacherModel> kTeachers = [
  TeacherModel(
    name: 'Mr. Ali Ahmed',
    image: AssetImages.teacher,
    specialist: 'Science',
    description:
        'Experienced science teacher with a focus on experiments and critical thinking.',
  ),
  TeacherModel(
    name: 'Ms. Sara Nabil',
    image: AssetImages.teacher,
    specialist: 'Mathematics',
    description:
        'Mathematics specialist who loves problem-solving and competitions.',
  ),
  TeacherModel(
    name: 'Mr. Omar Hany',
    image: AssetImages.teacher,
    specialist: 'History',
    description: 'Brings history to life through stories, maps, and debates.',
  ),
  TeacherModel(
    name: 'Ms. Lina Adel',
    image: AssetImages.teacher,
    specialist: 'Arabic',
    description:
        'Focuses on modern Arabic literature and clear writing skills.',
  ),
];
