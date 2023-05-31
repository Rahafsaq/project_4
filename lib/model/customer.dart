class Customer {
  final String email;
  final String name;
  final String location;

  const Customer({required this.email, required this.name, required this.location});

  @override
  String toString() {
    return 'Product $email $name $location ';
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      email: map['email'],
      name: map['name'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'location': location,
    };
  }
}
