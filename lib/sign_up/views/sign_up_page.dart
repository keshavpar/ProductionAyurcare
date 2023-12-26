import 'package:ayurcareprod/authentication/role.dart';
import 'package:ayurcareprod/sign_up/bloc/sign_up_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpForm extends StatelessWidget {
  final Role? role;
  const SignUpForm({super.key, this.role});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text("Authentication Failed")));
          }
        },
        child: mobileScreen(role)
        // deviceType==DeviceScreenType.mobile?

        );
  }
}

Widget mobileScreen(Role? role) {
  return Container(
    decoration: const BoxDecoration(color: Colors.white70),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const _Img(),
      const _TextComponent(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _FirstNameInput(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _LastNameInput(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _EmailInput(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _PasswordInput(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _ConfirmPasswordInput(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _SignUpButton(),
      SizedBox(
        height: 1.screenHeight,
      ),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _GoogleSignIn(),
      SizedBox(
        height: 5.screenHeight,
      ),
      _Mode(role: role),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _LogIn(),
    ]),
  );
}

class _Img extends StatelessWidget {
  const _Img();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 20.sh,
            width: 20.sw,
            child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 4, 134, 241),
                      Colors.blue,
                      Colors.green
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: state.role == Role.patient
                    ? SvgPicture.asset(
                        'assets/SignUpUser.svg',
                      )
                    : SvgPicture.asset(
                        'assets/doctorSignUp.svg',
                      )),
          ),
        );
      },
    );
  }
}

class _TextComponent extends StatelessWidget {
  const _TextComponent();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color.fromARGB(255, 4, 134, 241), Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: const Text(
        "Sign Up to Ayurcare",
        style: TextStyle(fontFamily: 'GoogleFont', fontSize: 22.0),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(SignUpEmailChanged(value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Email',
              errorText: state.email.invalid ? 'Invalid Email' : null,
            )),
      );
    });
  }
}

class _FirstNameInput extends StatelessWidget {
  const _FirstNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(SignUpFirstChanged(value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'First Name',
              errorText: state.firstname.invalid ? 'First Name Required' : null,
            )),
      );
    });
  }
}

class _LastNameInput extends StatelessWidget {
  const _LastNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(SignUpLastChanged(value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Last Name',
              errorText: state.lastname.invalid ? 'Last Name Required' : null,
            )),
      );
    });
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    bool flag = true;
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<SignUpBloc>().add(SignUpPasswordChanged(value));
            },
            obscureText: state.passVisible,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  if (flag == true) {
                    flag = false;
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpVisibilityChanged(false));
                  } else if (flag == false) {
                    flag = true;
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpVisibilityChanged(true));
                  }
                },
                child: state.passVisible
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Password',
              errorText: state.password.invalid ? 'Invalid Password' : null,
            )),
      );
    });
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput();

  @override
  Widget build(BuildContext context) {
    bool flag = true;
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context
                  .read<SignUpBloc>()
                  .add(SignUpConfirmPasswordChanged(value));
            },
            obscureText: state.passVisible,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  if (flag == true) {
                    flag = false;
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpVisibilityChanged(false));
                  } else if (flag == false) {
                    flag = true;
                    context
                        .read<SignUpBloc>()
                        .add(const SignUpVisibilityChanged(true));
                  }
                },
                child: state.passVisible
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Confirm Password',
              errorText: state.confirmPassword.pure || state.passequal
                  ? null
                  : 'Password Doesnt Match',
            )),
      );
    });
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.blue,
                Colors.green
              ], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius:
                BorderRadius.circular(25), // Adjust the border radius as needed
          ),
          child: ElevatedButton(
              onPressed: state.status.isValid && state.passequal
                  ? () {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpSubmitted(state.role));
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .transparent, // Set the button's background color to transparent
                elevation: 0, // Remove the button's elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: state.role == Role.patient
                  ? const Text(
                      'Login as a Patient',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  : const Text(
                      "Login as a Doctor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )));
    });
  }
}

class _GoogleSignIn extends StatelessWidget {
  const _GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          // Add your button click logic here
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text(
          'Google',
          style: TextStyle(
            color: Colors.black, // Text color
          ),
        ),
      );
    });
  }
}

class _Mode extends StatelessWidget {
  final Role? role;
  const _Mode({this.role});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      state.copyWith(role: role);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Log In as A Patient "),
          CupertinoSwitch(
            onChanged: (value) {
              if (value == false) {
                context
                    .read<SignUpBloc>()
                    .add(const SignUpRoleChanged(Role.patient));
              } else {
                context
                    .read<SignUpBloc>()
                    .add(const SignUpRoleChanged(Role.doctor));
              }
            },
            value: state.role == Role.patient ? false : true,
          ),
          const Text("Log In As A Doctor")
        ],
      );
    });
  }
}

class _LogIn extends StatelessWidget {
  const _LogIn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have an Account?"),
                Text(
                  "Log In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ));
      },
    );
  }
}
