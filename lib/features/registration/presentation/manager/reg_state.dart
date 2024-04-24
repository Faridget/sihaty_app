class RegState {}

class AuthInitialState extends RegState {}

//login
class LoginLoadingStat extends RegState {}

class LoginSuccessStat extends RegState {}

class LoginErrorStat extends RegState {
  final String error;
  LoginErrorStat({required this.error});
}


//register
class RegisterLoadingStat extends RegState {}

class RegisterSuccessStat extends RegState {}

class RegisterErrorStat extends RegState {
  final String error;
  RegisterErrorStat({required this.error});
}