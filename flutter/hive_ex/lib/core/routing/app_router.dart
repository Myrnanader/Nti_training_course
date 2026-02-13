import 'package:go_router/go_router.dart';
import '../../features/on_boarding/logic/on_boarding_controller.dart';
import '../../features/on_boarding/ui/on_boarding_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/note/ui/new_note_screen.dart';
import '../../features/note/ui/note_details_screen.dart';
import '../models/note_model.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: OnBoardingController.isOnBoarded()
      ? Routes.home
      : Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (_, __) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (_, __) => const HomeScreen(),
    ),
    
    GoRoute(
      path: Routes.newNote,
      builder: (context, state) {
        final note = state.extra as NoteModel?;
        return NewNoteScreen(note: note);
      },
    ),
    GoRoute(
      path: Routes.noteDetails,
      builder: (context, state) {
        final note = state.extra as NoteModel;
        return NoteDetailsScreen(note: note);
      },
    ),
  ],
);
