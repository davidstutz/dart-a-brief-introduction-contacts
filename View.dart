// Define library name
#library('view');

// Import HTML library.
#import('dart:html');

// Below all used views are defined.
// In bigger applications all views would be dervied from an
// abstract View class providing a render method and some properties.
// But abstract classes are not supported yet by Dart.
// So the HTML used by the views is hardcoded as property.

// List all contacts view.
class View_List {
  Element element;
  
  View_List(List<Model_Contact> contacts) {
    this.element = new Element.tag('ul');
    
    for (Model_Contact contact in contacts)
    {
      // See the usage of getters and setters:
      this.element.nodes.add(new Element.html('<li>${contact.last_name}, ${contact.first_name} - ${contact.phone} - ${contact.email}</li>'));
    }
  }
}

// Add a new contact view.
class View_Add {
  
  Element element;
  
  View_Add() {
    this.element = new Element.tag('table');
    
    Map<String, String> rows = {
      'first_name': 'First name',
      'last_name': 'Last name',
      'phone': 'Phone',
      'email': 'E-Mail',
    };
    
    rows.forEach(function(key, value) {
      // Create the tr node.
      Element row = new Element.tag('tr');
      
      // Create label and input cells.
      Element label = new Element.html('<td><label for="$key">$value</label></td>');
      Element input = new Element.html('<td><input type="text" name="$key" id="$key" /></td>');
      
      // Append label and input cells to row.
      row.nodes.add(label);
      row.nodes.add(input);
      
      // Append row to table.
      this.element.nodes.add(row);
    });
    
    // Create last row.
    // The last row contains only one cell with colspan two and a submit button.
    Element row = new Element.tag('tr');
    Element submit = new Element.tag('td');
    submit.attributes['colspan'] = '2';
    submit.innerHTML = '<button type="submit" id="submit">Submit</button>';
    row.nodes.add(submit);
    
    // Append row to table.
    this.element.nodes.add(row);
  }
}
