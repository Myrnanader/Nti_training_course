import '../../widgets/gender_card.dart';

class BmiState {
  final GenderType? gender;
  final int height;
  final int weight;
  final int age;

  const BmiState({
    this.gender,
    this.height = 160,
    this.weight = 60,
    this.age = 20,
  });

  BmiState copyWith({
    GenderType? gender,
    int? height,
    int? weight,
    int? age,
  }) {
    return BmiState(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}
