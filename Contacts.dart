// Import libraries using the #import declarative.
// Import HTML library.
#import('dart:html');

// Import views.
#import('View.dart');

// Import model.
#import('Model.dart');

// Main application class with initialization and all needed actions.
class Contacts {

  // Constructor...
  Contacts() {
    
  }

  // Will do all the initialization
  // and set up all needed event handlers.
  void run() {
    
    // Event handler for adding a new contact.
    var add_handler = (Event event) {
      
      // Prevent default action of link similar to JQuery.
      event.preventDefault();
      
      View_Add view = new View_Add();
      
      // Clean content area before appending the list:
      document.query('#content').nodes.clear(); // Equivalent to JQuery's empty().
      document.query('#content').nodes.add(view.element); // Equivalent to JQuery's append().
      
      // Bind submit event (no real on.submit but on.click).
      document.query('#submit').on.click.add((event) {
        
        // Add contact manually.
        Model.add(new Model_Contact.values({
          'first_name': document.query('input#first_name').value,
          'last_name': document.query('input#last_name').value,
          'phone': document.query('input#phone').value,
          'email': document.query('input#email').value,
        }));
        
        // Clear content and
        // add success message.
        document.query('#content').nodes.clear();
        document.query('#content').nodes.add(new Element.html('<div class="success">Successfully added contact.</div>'));
      });
    };
    
    // Event handler for listing all contacts.
    var list_handler = (Event event) {
      
      // Prevent default action of link similar to JQuery.
      event.preventDefault();
      
      // Get all contacts.
      List<Model_Contact> contacts = Model.find_all();
      
      View_List view = new View_List(contacts);
      
      // Clean content area before appending the list:
      document.query('#content').nodes.clear(); // Equivalent to JQuery's empty().
      document.query('#content').nodes.add(view.element); // Equivalent to JQuery's append().
    };
    
    // Initialize navigation.
    // A good example for event handling.
    // Will bind the navigation action to the appropriate event handler.
    // For DOM querying CSS selectors are used.
    document.query('#list').on.click.add(list_handler);
    document.query('#add').on.click.add(add_handler);
  }
}

// The main method: the entry point of the application.
void main() {
  // Add some sample contacts.
  Model.add(new Model_Contact.values({
    'first_name': 'David',
    'last_name': 'Stutz',
    'phone': '0178 636 1771',
    'email': 'david.stutz@rwth-aachen.de',
  }));
  
  // Run application.
  new Contacts().run();
}
