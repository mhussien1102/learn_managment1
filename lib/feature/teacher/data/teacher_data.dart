import '../../../core/model/teacher_model.dart';
import '../../../core/utils/assets.dart';

const List<TeacherModel> kTeachers = [
  TeacherModel(
    name: 'Mr. Ali Ahmed',
    image: AssetImages.teacher,
    specialist: 'Science',
    description:
        'Experienced science teacher with a focus on experiments and critical thinking.',
    availableDays: ['Monday', 'Thursday'],
    availableSlots: {
      'Monday': ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM'],
      'Thursday': ['10:30 AM', '11:30 AM', '12:30 PM', '1:30 PM', '3:30 PM'],
    },
    priceOfSession: 200,
  ),
  // Others use defaults
  TeacherModel(
    name: 'Ms. Sara Nabil',
    image: AssetImages.teacher,
    specialist: 'Mathematics',
    description:
        'Mathematics specialist who loves problem-solving and competitions.',
    availableDays: ['Monday', 'Thursday', "Sunday", "Wednesday", "Friday"],
    availableSlots: {
      'Monday': ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM'],
      'Thursday': ['10:30 AM', '11:30 AM', '12:30 PM', '1:30 PM', '3:30 PM'],
      "Sunday": ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM'],
      "Wednesday": ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM'],
      "Friday": ['10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM'],
    },
    priceOfSession: 250,
  ),
  TeacherModel(
    name: 'Mr. Omar Hany',
    image: AssetImages.teacher,
    specialist: 'History',
    description: 'Brings history to life through stories, maps, and debates.',
    priceOfSession: 300,
  ),
  TeacherModel(
    name: 'Ms. Lina Adel',
    image: AssetImages.teacher,
    specialist: 'Arabic',
    description:
        'Focuses on modern Arabic literature and clear writing skills.',
    priceOfSession: 300,
  ),
];
