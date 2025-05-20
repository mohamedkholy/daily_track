import 'package:daily_track/features/routine/data/models/routine.dart';

sealed class HomeState{
  List<Routine> routines;
  HomeState(this.routines);
}

class Loading extends HomeState{
  Loading():super([]);
}

class Loaded extends HomeState{
  Loaded(super.routines);
}

class NoRoutines extends HomeState{
  NoRoutines(super.routines);
}

class UpdateRoutineTitleFailed extends HomeState{
  UpdateRoutineTitleFailed(super.routines);
}


