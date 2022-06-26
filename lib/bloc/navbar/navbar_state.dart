part of 'navbar_bloc.dart';

abstract class NavbarState {}

class NavbarInitial extends NavbarState {}

class NavbarLoading extends NavbarState {}

class NavbarError extends NavbarState {
  String? error;

  NavbarError({this.error});
}
