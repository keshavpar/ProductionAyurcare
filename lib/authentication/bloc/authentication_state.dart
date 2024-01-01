part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.user, this.doc});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticatedUser(UserRepository user)
      : this._(status: AuthenticationStatus.authenticateduser, user: user);

  const AuthenticationState.authenticatedDoc(Doctor doctor)
      : this._(status: AuthenticationStatus.authenticateduser, doc: doctor);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final UserRepository? user;
  final Doctor? doc;

  @override
  List<Object?> get props => [status, user];
}
