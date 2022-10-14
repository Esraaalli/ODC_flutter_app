import 'package:flutter/material.dart';
import '../presentation/screens/events/events_screen.dart';
import '../presentation/screens/exams/finals_screen.dart';
import '../presentation/screens/lectures/lectures_screen.dart';
import '../presentation/screens/exams/midterms_screen.dart';
import '../presentation/screens/notes/notes_screen.dart';
import '../presentation/screens/sections/sections_screen.dart';
import 'models/home_card_model.dart';

List<HomeCardModel> homeItem = [
  HomeCardModel(icon: "assets/icons/lecture.svg", title: 'Lactures', screen: const LecturesScreen()),
  HomeCardModel(icon: "assets/icons/sections.svg", title: 'Section', screen: const SectionsScreen()),
  HomeCardModel(icon: "assets/icons/midterm.svg", title: 'Midterm', screen: MidtermsScreen() ),
  HomeCardModel(icon: "assets/icons/final.svg", title: 'Finals', screen: FinalsScreen() ),
  HomeCardModel(icon: "assets/icons/event.svg", title: 'Events', screen:const EventsScreen() ),
  HomeCardModel(icon: "assets/icons/notes.svg", title: 'Notes', screen: const NotesScreen()),
];