class User {
  final String givenName;
  final String familyName;
  final String imageUrl;
  const User({
    required this.givenName,
    required this.familyName,
    required this.imageUrl,
  });
}

const User currentUser = User(
  givenName: 'احمد ',
  familyName: 'احمد ',
  imageUrl: 'asset/image/mathrew.jfif',
);

const List<User> _allUsers = [
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/ed.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/david.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/james.png',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/mathrew.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/mathrew.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'Morris',
    imageUrl: 'asset/images/ed.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/mathrew.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/james.png',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/james.png',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد ',
    imageUrl: 'asset/images/mathrew.jfif',
  ),
  User(
    givenName: 'احمد ',
    familyName: 'احمد',
    imageUrl: 'asset/images/mathrew.jfif',
  ),
];

class Room {
  final String name;
  final List<User> speakers;
  final List<User> speakersSolve;
  final List<User> followedBySpeakers;
  final List<User> followedBySpeakersSolve;

  const Room({
    required this.name,
    this.speakers = const [],
    this.speakersSolve = const [],
    this.followedBySpeakers = const [],
    this.followedBySpeakersSolve = const [],
  });
}

final List<Room> roomsList = [
  Room(
    name: 'اهمية التطعيم للوقاية من الامراض الموسمية',
    speakers: (List<User>.from(_allUsers)..shuffle()).getRange(0, 4).toList(),
    followedBySpeakers: List<User>.from(_allUsers)..shuffle(),
    speakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
    followedBySpeakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
  ),
  Room(
    name: 'اهمية التطعيم للوقاية من الامراض الموسمية',
    speakers: (List<User>.from(_allUsers)..shuffle()).getRange(0, 4).toList(),
    followedBySpeakers: List<User>.from(_allUsers)..shuffle(),
    speakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
    followedBySpeakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
  ),
  Room(
    name: 'اهمية التطعيم للوقاية من الامراض الموسمية',
    speakers: (List<User>.from(_allUsers)..shuffle()).getRange(0, 4).toList(),
    followedBySpeakers: List<User>.from(_allUsers)..shuffle(),
    speakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
    followedBySpeakersSolve:
        (List<User>.from(_allUsers)..shuffle()).getRange(0, 6).toList(),
  ),
];
