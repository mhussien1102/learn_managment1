class TeacherModel {
  final String name;
  final String image; // asset path
  final String specialist;
  final String description;
  final String? facebookUrl;
  final double priceOfSession;

  /// NEW: which days this teacher accepts bookings
  final List<String> availableDays;

  /// NEW: slots per day (keys must match items in [availableDays])
  final Map<String, List<String>> availableSlots;

  // Defaults that mimic your UI
  static const List<String> _defaultDays = ['Monday', 'Wednesday', 'Saturday'];
  static const List<String> _defaultTimes = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
  ];
  static const Map<String, List<String>> _defaultSlots = {
    'Monday': _defaultTimes,
    'Wednesday': _defaultTimes,
    'Saturday': _defaultTimes,
  };

  const TeacherModel({
    required this.name,
    required this.priceOfSession,
    required this.image,
    required this.specialist,
    required this.description,
    this.facebookUrl = "www.google.com",
    this.availableDays = _defaultDays,
    this.availableSlots = _defaultSlots,
  });
}
