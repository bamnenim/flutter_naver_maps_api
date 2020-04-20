class TooManyWaypointsException implements Exception{
  @override
  String toString() {
    return 'waypoints length in request is too long! waypoints should be less than 15!';
  }
}