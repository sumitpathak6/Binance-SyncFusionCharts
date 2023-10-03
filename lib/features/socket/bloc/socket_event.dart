part of 'socket_bloc.dart';

@immutable
sealed class SocketEvent {}

class SocketInitialFetchEvent extends SocketEvent{}