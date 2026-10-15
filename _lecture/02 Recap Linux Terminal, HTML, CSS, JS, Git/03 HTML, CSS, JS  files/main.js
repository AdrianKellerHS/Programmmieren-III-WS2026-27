function helloName() {
    const name = document.getElementById('nameInput').value;

    if (name) {
        //alert('Hallo ' + name + '!');  // String Concatenation
        alert(`Hallo ${name}!`); // Better: Template Strings (ES6)
    } else {
        alert('Hallo Welt!');
    }
}