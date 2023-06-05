class userModal {
  int? id;
  String? name, username, email, phone, website;
  AddressModal? addressModal;
  CompnyModal? companyModal;

  userModal({this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.companyModal,
    this.addressModal});

  factory userModal.fromjson(Map m1) {
    return userModal(
        email: m1['email'],
        name: m1['name'],
        id: m1['id'],
        phone: m1['phone'],
        username: m1['username'],
        website: m1['website'],
        addressModal: AddressModal.fromjson(m1['address']),
        companyModal:CompnyModal.formjson(m1['company']));
  }
}

class AddressModal {

  String? street, suite, city, zipcode;

  GeoLacatorModal? geo;

  AddressModal({this.city, this.street, this.suite, this.zipcode, this.geo});

  factory AddressModal.fromjson(Map m1)
  {
    return AddressModal(
      city: m1['city'],
      street: m1['street'],
      suite: m1['suite'],
      zipcode: m1['zipcode'],
      geo: GeoLacatorModal.formjson(m1['geo']),);
  }
}

class GeoLacatorModal {
  String? lat, lng;

  GeoLacatorModal({this.lat, this.lng});

  factory GeoLacatorModal.formjson(Map m1)
  {
    return GeoLacatorModal(lat: m1['lat'], lng: m1['lng']);
  }

}

class CompnyModal{

  String? name,catchPhrase,bs;

  CompnyModal({this.name,this.bs,this.catchPhrase});

  factory CompnyModal.formjson(Map m1)
  {
    return CompnyModal(name: m1['name'],bs: m1['bs'],catchPhrase: m1['catchPhrase']);
  }
}