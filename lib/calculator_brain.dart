class CalculatorBrain {
  final int ht;
  final int wt;
  double _bmi;

  CalculatorBrain(this.ht, this.wt);

  String getBmi() {
    _bmi = wt / ((ht * ht) / 10000);
    return _bmi.toStringAsFixed(1);
  }

  String getRemark() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getSuggest() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight , Try to exercise more';
    } else if (_bmi >= 18) {
      return 'You have a normal body weight, Good Job!';
    } else {
      return 'Your BMI is quite low , you should eat more!';
    }
  }
}
