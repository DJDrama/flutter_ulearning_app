sealed class RegisterEvent {
  const RegisterEvent();
}

final class RegisterInputUserName extends RegisterEvent {
  final String userName;

  const RegisterInputUserName(this.userName);
}

final class RegisterInputEmail extends RegisterEvent {
  final String email;

  const RegisterInputEmail(this.email);
}

final class RegisterInputPassword extends RegisterEvent {
  final String password;

  const RegisterInputPassword(this.password);
}

final class RegisterInputConfirmPassword extends RegisterEvent {
  final String confirmPassword;

  const RegisterInputConfirmPassword(this.confirmPassword);
}
