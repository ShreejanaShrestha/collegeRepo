const signup = document.getElementById("signup");

signup.onclick = (e) => {
    e.preventDefault();

    var email = document.getElementById("email").value;
    var name = document.getElementById("name").value;
    var password = document.getElementById("password").value;
    var location = document.getElementById("location").value;
    var lastVisit = new Date();

    if (!name || !email || !password || !location) {
        alert('All fields are required.');
        return;
    }

    var user = {
        username: name,
        location: location,
        email: email,
        password: password,
    };

    localStorage.setItem("name", name);
    localStorage.setItem("lastVisit", lastVisit);
    var json = JSON.stringify(user);
    localStorage.setItem(name, json);
    console.log("user added");
    document.getElementById('signup-form').reset();

}

document.getElementById('get-items').addEventListener('click', function() {
    const name = localStorage.getItem('name');
    const user = JSON.parse(localStorage.getItem(name));
    console.log(user);
    const lastVisit = localStorage.getItem('lastVisit');

    if (user) {
        const itemsList = document.getElementById('items-list');
        itemsList.innerHTML = `
            <p><strong>Name:</strong> ${user.username}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Password:</strong> ${user.password}</p>
            <p><strong>Location:</strong> ${user.location}</p>
            <p><strong>Last Visited:</strong> ${lastVisit}</p>
        `;
    } else {
        alert('No user found in local storage.');
    }
});

document.getElementById('delete-items').addEventListener('click', function() {
    const name = localStorage.getItem('name');
    localStorage.removeItem(name);
    localStorage.removeItem('name');
    localStorage.removeItem('lastVisit');
    alert('User deleted from local storage.');
    document.getElementById('items-list').innerHTML = '';
});