// Define library name.
#library('model');

// On bigger applications an ORM system or similar would be used.
// For simplicity the Model class does only need to manage contacts.
class Model {
  
  static List<Model_Contact> contacts;
  
  // Add a new contact to the list.
  static void add(Model_Contact contact) {
    if (Model.contacts == null)
    {
      Model.contacts = [];
    }
    Model.contacts.add(contact);
    contact.id = Model.contacts.indexOf(contact);
  }
  
  // Returns a list of all contacts.
  // Currently the contacts are hard coded for simplicity.
  // They could also be loaded from a server via AJAX.
  static List<Model_Contact> find_all() {
    return Model.contacts;
  }
}

// Model for single contact.
class Model_Contact {
  
  // Attributes all automatically declared private
  // because of the prefixed underscore.
  var _id;
  String _first_name;
  String _last_name;
  String _phone;
  String _email;
  
  // Default contructor.
  Model_Contact () {
    
  }
  
  // Creates a contact from an id and a map of values,
  // A good example for named constructors.
  Model_Contact.values(Map<String, String> values) {
     this._first_name = values['first_name'];
     this._last_name = values['last_name'];
     this._phone = values['phone'];
     this._email = values['email'];
  }
  
  // Getters and setters for all attributes.
  // Note the shorthand syntax used.
  
  
  Map<String, String> as_array() => {
    'first_name': this._first_name,
    'last_name': this._last_name,
    'phone': this._phone,
    'email': this._email,
  };
}
