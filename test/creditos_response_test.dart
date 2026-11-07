import 'package:flutter_test/flutter_test.dart';
import 'package:peliculas/components/shared/request_model.dart';

void main() {
  test('reads the cast from a movie credits response', () {
    final response = RequestModel.fromJson({
      'id': 123,
      'cast': [
        {'name': 'Actor de prueba'},
      ],
      'crew': [],
    });

    expect(response.results, hasLength(1));
    expect(response.results.first['name'], 'Actor de prueba');
    expect(response.page, 0);
    expect(response.totalPages, 0);
    expect(response.totalResults, 0);
  });
}
