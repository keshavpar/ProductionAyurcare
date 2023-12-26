import 'package:ayurcareprod/authentication/role.dart';
import 'package:ayurcareprod/log_in/login.dart';
import 'package:ayurcareprod/log_in/views/forgot_passpage.dart';
import 'package:ayurcareprod/sign_up/views/sign_up_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text("Authentication Failed")));
          }
        },
        child: mobileScreen());
  }
}

Widget mobileScreen() {
  return Container(
    decoration: const BoxDecoration(color: Colors.white70),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const _Img(),
      const _TextComponent(),
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
      const _LoginButton(),
      SizedBox(
        height: 1.screenHeight,
      ),
      const _ForgotPassword(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _GoogleSignIn(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _Mode(),
      SizedBox(
        height: 5.screenHeight,
      ),
      const _SignUp(),
    ]),
  );
}

class _Img extends StatelessWidget {
  const _Img();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
                        'assets/UserLogin.svg',
                        //   color:
                        //       Colors.white, // Set the color to white to apply the gradient
                      )
                    : SvgPicture.asset(
                        'assets/doctorLogin.svg',
                        //   color:
                        //       Colors.white, // Set the color to white to apply the gradient
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
        "Log In to Ayurcare",
        style: TextStyle(fontFamily: 'GoogleFont', fontSize: 22.0),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<LoginBloc>().add(LoginEmailChanged(value));
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

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    bool flag = true;
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return SizedBox(
        width: 80.screenWidth,
        child: TextField(
            onChanged: (value) {
              context.read<LoginBloc>().add(LoginPasswordChanged(value));
            },
            obscureText: state.passVisible,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  if (flag == true) {
                    flag = false;
                    context
                        .read<LoginBloc>()
                        .add(const LoginVisibilityChanged(false));
                  } else if (flag == false) {
                    flag = true;
                    context
                        .read<LoginBloc>()
                        .add(const LoginVisibilityChanged(true));
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
              onPressed: state.status.isValid
                  ? () {
                      context.read<LoginBloc>().add(LoginSubmitted(state.role));
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

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage()));
          },
          child: const Text("Forgot Password"));
    });
  }
}

class _GoogleSignIn extends StatelessWidget {
  const _GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
  const _Mode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Log In as A Patient "),
          CupertinoSwitch(
            onChanged: (value) {
              if (value == false) {
                context
                    .read<LoginBloc>()
                    .add(const LoginRoleChanged(Role.patient));
              } else {
                context
                    .read<LoginBloc>()
                    .add(const LoginRoleChanged(Role.doctor));
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

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage(
                            role: state.role,
                          )));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an Account?"),
                Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ));
      },
    );
  }
}
