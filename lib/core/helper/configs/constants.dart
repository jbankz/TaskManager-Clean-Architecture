class AppConstants {
  AppConstants._();

  static int timeOutDuration = 30;
  static String? tempEmail;
  static String? tempPassword;
  static String? usersPrefKey = 'user';
  static String? bearer = 'Bearer ';

  static List<String> getStates() {
    List<String> _states = [];
    Constants.states().map((state) => _states.add(state.state!)).toList();
    _states.sort();
    return _states;
  }

  static List<String> getRelationship() {
    List<String> _relationShip = [
      "Father",
      'Mother',
      'Brother',
      'Sister',
      'Nephew',
      'Niece',
      'Uncle',
      'Aunty',
      'Cousin',
      'Others'
    ];
    _relationShip.sort();
    return _relationShip;
  }
}

class Constants {
  String? state;
  int? statePosition;

  Constants({this.state, this.statePosition});

  static List<Constants> states() {
    List<Constants> _states = [];
    Constants _s = Constants(state: 'Abia', statePosition: 0);
    _states.add(_s);
    _s = Constants(state: 'Adamawa', statePosition: 1);
    _states.add(_s);
    _s = Constants(state: 'Akwa Ibom', statePosition: 2);
    _states.add(_s);
    _s = Constants(state: 'Anambra', statePosition: 3);
    _states.add(_s);
    _s = Constants(state: 'Bauchi', statePosition: 4);
    _states.add(_s);
    _s = Constants(state: 'Bayelsa', statePosition: 5);
    _states.add(_s);
    _s = Constants(state: 'Benue', statePosition: 6);
    _states.add(_s);
    _s = Constants(state: 'Borno', statePosition: 7);
    _states.add(_s);
    _s = Constants(state: 'Cross River', statePosition: 8);
    _states.add(_s);
    _s = Constants(state: 'Delta', statePosition: 9);
    _states.add(_s);
    _s = Constants(state: 'Ebonyi', statePosition: 10);
    _states.add(_s);
    _s = Constants(state: 'Enugu', statePosition: 11);
    _states.add(_s);
    _s = Constants(state: 'Ekiti', statePosition: 12);
    _states.add(_s);
    _s = Constants(state: 'Gombe', statePosition: 13);
    _states.add(_s);
    _s = Constants(state: 'Imo', statePosition: 14);
    _states.add(_s);
    _s = Constants(state: 'Jigawa', statePosition: 15);
    _states.add(_s);
    _s = Constants(state: 'Kaduna', statePosition: 16);
    _states.add(_s);
    _s = Constants(state: 'Kano', statePosition: 17);
    _states.add(_s);
    _s = Constants(state: 'Katsina', statePosition: 18);
    _states.add(_s);
    _s = Constants(state: 'Kebbi', statePosition: 19);
    _states.add(_s);
    _s = Constants(state: 'Kogi', statePosition: 20);
    _states.add(_s);
    _s = Constants(state: 'Kebbi', statePosition: 21);
    _states.add(_s);
    _s = Constants(state: 'Kwara', statePosition: 22);
    _states.add(_s);
    _s = Constants(state: 'Lagos', statePosition: 23);
    _states.add(_s);
    _s = Constants(state: 'Nasarawa', statePosition: 24);
    _states.add(_s);
    _s = Constants(state: 'Niger', statePosition: 25);
    _states.add(_s);
    _s = Constants(state: 'Ogun', statePosition: 26);
    _states.add(_s);
    _s = Constants(state: 'Ondo', statePosition: 27);
    _states.add(_s);
    _s = Constants(state: 'Osun', statePosition: 28);
    _states.add(_s);
    _s = Constants(state: 'Oyo', statePosition: 29);
    _states.add(_s);
    _s = Constants(state: 'Plateau', statePosition: 30);
    _states.add(_s);
    _s = Constants(state: 'Rivers', statePosition: 31);
    _states.add(_s);
    _s = Constants(state: 'Sokoto', statePosition: 32);
    _states.add(_s);
    _s = Constants(state: 'Taraba', statePosition: 33);
    _states.add(_s);
    _s = Constants(state: 'Yobe', statePosition: 34);
    _states.add(_s);
    _s = Constants(state: 'Zamfara', statePosition: 35);
    _states.add(_s);
    _s = Constants(state: 'Abuja', statePosition: 36);
    _states.add(_s);
    return _states;
  }
}
