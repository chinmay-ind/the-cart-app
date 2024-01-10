import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  late SharedPreferences prefs;

  ///initialise shared prefs
  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get loggedInUser => prefs.getString(userLoggedIn) ?? '';

  set loggedInUser(String value) {
    prefs.setString(userLoggedIn, value);
  }

  String get userList => prefs.getString(keyUserList) ?? userDefaultList;

  set userList(String value) {
    prefs.setString(keyUserList, value);
  }

  String get productList =>
      prefs.getString(keyProductList) ?? defaultProductList;

  set productList(String value) {
    prefs.setString(keyProductList, value);
  }

  logout() async {
    prefs.remove(userLoggedIn);
    productList = defaultProductList;
    userList = userDefaultList;
  }

  String userDefaultList = '''{
  "users": [
    {
      "username": "o.pimple@gmail.com",
      "password": "om123",
      "dob": "17-02-2002"
    },
    {
      "username": "o.tari@gmail.com",
      "password": "omkar123",
      "dob": "29-09-1993"
    },
    {
      "username": "l.parab@gmail.com",
      "password": "lokesh123",
      "dob": "17-04-1999"
    }
  ]
}''';

  String defaultProductList = '''{
  "mobiles": [
    {
      "manufactureAddress": "USA",
      "productName": "iPhone",
      "modelNumber": 231231,
      "manufactureDate": "01-01-2020",
      "price": 40000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "SAMSUNG",
      "modelNumber": 231232,
      "manufactureDate": "21-01-2022",
      "price": 70000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "VIVO",
      "modelNumber": 231233,
      "manufactureDate": "21-10-2023",
      "price": 80000
    },
    {
      "manufactureAddress": "DUBAI",
      "productName": "LAVA",
      "modelNumber": 231234,
      "manufactureDate": "01-09-2020",
      "price": 45000
    }
  ],
  "ac": [
    {
      "manufactureAddress": "JAPAN",
      "productName": "DAIKIN",
      "modelNumber": 231211,
      "manufactureDate": "21-01-2020",
      "price": 20000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "PANASONIC",
      "modelNumber": 231212,
      "manufactureDate": "21-01-2022",
      "price": 25000
    },
    {
      "manufactureAddress": "GERMANY",
      "productName": "VIDEOCON",
      "modelNumber": 231213,
      "manufactureDate": "21-10-2023",
      "price": 27000
    },
    {
      "manufactureAddress": "DUBAI",
      "productName": "LG",
      "modelNumber": 231214,
      "manufactureDate": "01-09-2020",
      "price": 30000
    }
  ],
  "laptop": [
    {
      "manufactureAddress": "JAPAN",
      "productName": "LENOVO",
      "modelNumber": 231221,
      "manufactureDate": "21-01-2020",
      "price": 20000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "ASUS",
      "modelNumber": 231222,
      "manufactureDate": "21-01-2022",
      "price": 30000
    },
    {
      "manufactureAddress": "USA",
      "productName": "MACBOOK",
      "modelNumber": 231223,
      "manufactureDate": "21-10-2023",
      "price": 70000
    },
    {
      "manufactureAddress": "DUBAI",
      "productName": "DELL",
      "modelNumber": 231224,
      "manufactureDate": "01-09-2020",
      "price": 40000
    }
  ],
  "camera": [
    {
      "manufactureAddress": "JAPAN",
      "productName": "CANON",
      "modelNumber": 231271,
      "manufactureDate": "21-01-2020",
      "price": 80000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "NIKON",
      "modelNumber": 231272,
      "manufactureDate": "21-01-2022",
      "price": 70000
    },
    {
      "manufactureAddress": "GERMANY",
      "productName": "KODAK",
      "modelNumber": 231273,
      "manufactureDate": "21-10-2023",
      "price": 75000
    },
    {
      "manufactureAddress": "DUBAI",
      "productName": "FUJI FILMS",
      "modelNumber": 231274,
      "manufactureDate": "01-09-2020",
      "price": 90000
    }
  ],
  "watches": [
    {
      "manufactureAddress": "JAPAN",
      "productName": "SAMSUNG",
      "modelNumber": 231291,
      "manufactureDate": "21-01-2020",
      "price": 20000
    },
    {
      "manufactureAddress": "INDIA",
      "productName": "BOAT",
      "modelNumber": 231292,
      "manufactureDate": "21-01-2022",
      "price": 2000
    },
    {
      "manufactureAddress": "GERMANY",
      "productName": "FIRE-BOULT",
      "modelNumber": 231293,
      "manufactureDate": "21-10-2023",
      "price": 2700
    },
    {
      "manufactureAddress": "DUBAI",
      "productName": "PORTRONICS",
      "modelNumber": 231294,
      "manufactureDate": "01-09-2020",
      "price": 3000
    }
  ]
}''';
}

const String keyUserList = "users_list";
const String keyProductList = "product_list";
const String userLoggedIn = "logged_in_user";
final localData = LocalData();
