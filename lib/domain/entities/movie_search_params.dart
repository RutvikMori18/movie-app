import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable {
  final String searchText;

  const MovieSearchParams({required this.searchText});

  @override
  // TODO: implement props
  List<Object?> get props => [searchText];
}
