import 'package:flutter/material.dart';
import 'package:learn_managment1/feature/teacher/widget/appoinment_day_ship.dart';
import 'package:learn_managment1/feature/teacher/widget/appoinment_form_filed.dart';
import 'package:learn_managment1/feature/teacher/widget/appoinment_headers.dart';
import 'package:learn_managment1/feature/teacher/widget/appoinment_slot_ship.dart';
import 'package:learn_managment1/feature/teacher/widget/appointment_payment_methods.dart';
import '../../core/model/teacher_model.dart';
import '../../core/utils/constants.dart';
import '../../core/widgets/custom_button.dart';

class BookAppointment extends StatefulWidget {
  final TeacherModel teacher;
  const BookAppointment({super.key, required this.teacher});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  final _educationLevelCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  // State
  late final List<String> _days;
  late final Map<String, List<String>> _slotsByDay;
  String? _selectedDay;
  String? _selectedSlot;
  String _gender = 'Male';
  String _selectedPayment = "Vodafone Cash";

  List<String> get _slots =>
      (_selectedDay != null ? _slotsByDay[_selectedDay] : null) ?? const [];

  bool get _isPhoneRequired =>
      _selectedPayment == "Vodafone Cash" || _selectedPayment == "InstaPay";

  @override
  void initState() {
    super.initState();
    _days = widget.teacher.availableDays;
    _slotsByDay = widget.teacher.availableSlots;
    _selectedDay = _days.isNotEmpty ? _days.first : null;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    _notesCtrl.dispose();
    _educationLevelCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _confirmAppointment() {
    if (!_formKey.currentState!.validate()) {
      _showSnack('Invalid data', isError: true);
      return;
    }
    if (_selectedDay == null || _selectedSlot == null) {
      _showSnack('Please select a day and a time slot', isError: true);
      return;
    }
    if (_isPhoneRequired && _phoneCtrl.text.trim().isEmpty) {
      _showSnack('Please enter a phone number', isError: true);
      return;
    }
    _showSnack(
      'Appointment confirmed on $_selectedDay at $_selectedSlot '
      'for ${_nameCtrl.text.isEmpty ? 'Student' : _nameCtrl.text}.',
      isError: false,
    );
  }

  void _showSnack(String msg, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.red : primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.teacher;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppointmentHeader(t: t),
              const SizedBox(height: 20),
              AppointmentDayChips(
                days: _days,
                selectedDay: _selectedDay,
                onDaySelected:
                    (day) => setState(() {
                      _selectedDay = day;
                      _selectedSlot = null;
                    }),
              ),
              const SizedBox(height: 20),
              AppointmentSlotChips(
                slots: _slots,
                selectedSlot: _selectedSlot,
                onSlotSelected: (slot) => setState(() => _selectedSlot = slot),
              ),
              const SizedBox(height: 20),
              AppointmentFormFields(
                nameCtrl: _nameCtrl,
                ageCtrl: _ageCtrl,
                educationLevelCtrl: _educationLevelCtrl,
                gender: _gender,
                onGenderChanged: (g) => setState(() => _gender = g),
                notesCtrl: _notesCtrl,
              ),
              const SizedBox(height: 16),
              AppointmentPaymentMethods(
                selectedPayment: _selectedPayment,
                onPaymentChanged: (p) => setState(() => _selectedPayment = p),
                isPhoneRequired: _isPhoneRequired,
                phoneCtrl: _phoneCtrl,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Confirm Appointment",
                onPressed: _confirmAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
