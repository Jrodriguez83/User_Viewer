abstract class UserData {}

class User extends UserData {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phoneNumber;
  String website;
  String companyName;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.website,
    required this.companyName,
  });
}

class Address extends UserData {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });
}
