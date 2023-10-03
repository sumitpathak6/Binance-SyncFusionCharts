part of 'socket_bloc.dart';

@immutable
sealed class SocketState {}

abstract class SocketActionState extends SocketState {}

final class SocketInitial extends SocketState {}

class SocketFetchingLoadingState extends SocketState {}

class SocketFetchingErrorState extends SocketState {}

class SocketFetchingSuccessState extends SocketState {
  final List<SocketDataModel> sockets;

  SocketFetchingSuccessState({required this.sockets});
}
