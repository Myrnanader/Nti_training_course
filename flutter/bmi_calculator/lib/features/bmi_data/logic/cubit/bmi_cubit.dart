import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_state.dart';
import '../../widgets/gender_card.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiState());

  void selectGender(GenderType gender) {
    emit(state.copyWith(gender: gender));
  }

  void changeHeight(int height) {
    emit(state.copyWith(height: height));
  }

  void incrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decrementWeight() {
    emit(state.copyWith(weight: state.weight - 1));
  }

  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decrementAge() {
    emit(state.copyWith(age: state.age - 1));
  }
}
