var dropdown = document.getElementsByClassName("profilebutton");
var i;

for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function () {

        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}




var staffListInfo = document.getElementById("tablelist");

function updateData() {
    var request = new XMLHttpRequest();
    request.open('GET', '/JsonStaffListAPI');
    request.onload = function () {
        var data = JSON.parse(request.responseText);
        renderHTML(data);
        searchTable();
    }
    request.send();
}

function renderHTML(data) {
    var htmlString = ``;

    for (var i = 0; i < data.length; i++) {

        htmlString += '<tr>' +
            '<td>' + data[i].staffID + '</td>' +
            '<td>' + data[i].firstname + ' ' + data[i].lastname + '</td>' +
            '<td>' + data[i].contactNumber + '</td>' +
            '<td>' + data[i].email + '</td>' +
            '<td>' + data[i].username + '</td>' +
            '<td>' + data[i].password + '</td>' +
            '<td>' + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + '</td>' +
            '<td><button onclick="updateStaff(' + data[i].staffID + ', \'' + data[i].firstname + '\', \'' + data[i].lastname + '\', \'' + data[i].username + '\', \'' + data[i].contactNumber + '\', \'' + data[i].email + '\', \'' + data[i].password + '\', \'' + data[i].isLocked + '\')" class="update" style="background-color: #0056b3;color: white; font-size: .7em;">Update</button>' +
            '<button onclick="removeStaff(' + data[i].staffID + ')" class="delete" style="background-color: #EE4E4E; font-size: .7em; color: white;">Delete</button></td>' +
            '</tr>';




        // htmlString += "<tr>";
        // htmlString += "<td>" + data[i].staffID + "</td>";
        // htmlString += "<td>" + data[i].firstname + " " + data[i].lastname + "</td>";
        // htmlString += "<td>+63" + data[i].contactNumber + "</td>";
        // htmlString += "<td>" + data[i].email + "</td>";
        // htmlString += "<td>" + data[i].username + "</td>";
        // htmlString += "<td>" + data[i].password + "</td>";
        // htmlString += "<td>" + (data[i].isLocked === 1 ? "Locked" : "Not Locked") + "</td>";
        // htmlString += '<td><button onclick="updateStaff(' + data[i].staffID + ', \'' + data[i].firstname + '\')" class="update" style="background-color: #97BE5A; font-size: .7em;">Update</button></td>';
        // htmlString += '<button onclick="removeStaff(' + data[i].staffID + ')" class="delete" style="background-color: #EE4E4E; font-size: .7em;">Delete</button>';
        // htmlString += "</tr>";
    }

    staffListInfo.innerHTML = htmlString;
}

document.addEventListener("DOMContentLoaded", event => {
    updateData();
});

// Get elements
const addAccountButton = document.querySelector('.add-account-btn');
const closeModalButton = document.querySelector('.close-btn');
const modal = document.querySelector('.modal');
const overlay = document.querySelector('.overlay');

// Function to open the modal
function openModal() {
    modal.classList.add('active');
    overlay.classList.add('active');
}

// Function to close the modal
function closeModal() {
    modal.classList.remove('active');
    overlay.classList.remove('active');
}

// Event listeners
addAccountButton.addEventListener('click', openModal);
closeModalButton.addEventListener('click', closeModal);
overlay.addEventListener('click', closeModal);

$(document).ready(function () {
    $('#staffRegisterForm').on('submit', function (event) {
        event.preventDefault(); // Prevent the default form submission

        // Create a new AJAX request
        var url = 'staffRegister_Servlet';

        // Prepare the POST request with form data
        var params = $(this).serialize();

        $.ajax({
            url: url,
            type: 'POST',
            data: params,
            success: function (response) {
                openModal()
                $.confirm({
                    boxWidth: '30%',
                    useBootstrap: false,
                    title: 'Registration Successful',
                    content: response,
                    type: 'green',
                    typeAnimated: true,
                    buttons: {
                        tryAgain: {
                            text: 'add more',
                            btnClass: 'btn-green',
                            action: function () {
                                openModal()
                            }
                        },
                        ok: {
                            text: 'ok',
                            action: function () {
                                closeModal()
                            }
                        }
                    }
                });
            },
            error: function (xhr) {
                openModal()
                $.confirm({
                    boxWidth: '30%',
                    useBootstrap: false,
                    title: 'Encountered an error!',
                    content: xhr.responseText,
                    type: 'red',
                    typeAnimated: true,
                    buttons: {
                        tryAgain: {
                            text: 'Try again',
                            btnClass: 'btn-red',
                            action: function () {
                                closeModal()

                            }
                        },
                    }
                });
            }
        });
    });
});

//delete staff
function removeStaff(id) {
    $.confirm({
        boxWidth: '30%',
        useBootstrap: false,
        type: 'blue',
        typeAnimated: true,
        title: 'Delete staff : ' + id + '?',
        content: 'This dialog will automatically trigger \'cancel\' in 10 seconds if you don\'t respond.',
        autoClose: 'cancel|10000',
        buttons: {
            deleteUser: {
                text: 'delete',
                btnClass: 'btn-red',
                action: function () {
                    // Create the AJAX request
                    $.ajax({
                        url: 'RemoveStaff_Servlet?idNo=' + id, // Replace with your endpoint
                        type: 'DELETE', // Send the ID as data
                        success: function (response) {
                            $.alert({
                                boxWidth: '30%',
                                useBootstrap: false,
                                typeAnimated: true,
                                type: 'green',
                                title: 'Response',
                                content: response
                            });
                            updateData();
                        },
                        error: function (xhr) {
                            $.alert({
                                boxWidth: '30%',
                                useBootstrap: false,
                                type: 'red',
                                typeAnimated: true,
                                title: 'error',
                                content: xhr.statusText
                            });
                        }
                    });
                }
            },
            cancel: function () {
                $.alert({
                    boxWidth: '30%',
                    useBootstrap: false,
                    typeAnimated: true,
                    type: 'red',
                    title: 'Canceled',
                    content: 'action is canceled'
                });
            }
        }
    });

}


function updateStaff(id, firstname, lastname, username, contactnumber, email, password, islocked) {
    $.confirm({
        type: 'blue',
        boxWidth: '50%',
        useBootstrap: false,
        title: 'Update Staff : ' + id,
        content: `
        <div class="register-form">
        <form id="staffRegisterForm">
            <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                <input class="firstname-input" required="required" type="text"
                    name="txtFirstname" value="`+ firstname + `">
                <label for="firstname" class="firstname-label">First name</label>
            </div>
            <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                <input class="lastname-input" required="required" type="text"
                    name="txtLastname" value="`+ lastname + `">
                <label for="lastname" class="lastname-label">Last name</label>
            </div>

            <div class="input-container full-width" style="width: 40%; margin: 0 20px 0 20px;">
                <input class="username-input" required="required" type="text"
                    name="txtUsername" value="`+ username + `">
                <label for="username" class="username-label">Username</label>
            </div>

            <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                <input class="contactno-input" required="required" type="text"
                    name="txtContactno" value="`+ contactnumber + `" maxlength="11">
                <label for="contactno" class="contactno-label">Contact no.</label>
            </div>

            <div class="input-container" style="width: 91%; margin-left: 20px;">
                <input class="email-input" required="required" type="text" name="txtEmail" value="`+ email + `">
                <label for="email" class="email-label">Email</label>
            </div>

            
            <div class="input-container" style="width: 91%; margin-left: 20px;">
                <input class="password-input" required="required" type="password" name="txtPassword" value="`+ password + `">
                <label for="password" class="password-label">Password</label>
            </div>

            <div class="input-container" style="width: 91%; margin: 0 20px 5% 20px;">
                <input class="confirmpassword-input" required="required" type="password" name="txtConfirmpassword" value="`+ password + `">
                <label for="confirmpassword" class="confirmpassword-label">Confirm Password</label>
            </div>	
            
            <label class="checkbox-container">
                <input type="checkbox"required="required" type="checkbox" name="txtConfirmpassword" `+ (islocked == 1 ? "checked" : "") + `>
                <div class="checkbox-custom"></div>
                <span class="checkbox-label">Lock profile</span>
            </label>
        </form>
    </div>
        `,
        buttons: {
            sayMyName: {
                text: 'Update',
                btnClass: 'btn-green',
                action: function () {

                    var firstname = this.$content.find('.firstname-input');
                    var lastname = this.$content.find('.lastname-input');
                    var email = this.$content.find('.email-input');
                    var contactno = this.$content.find('.contactno-input');
                    var username = this.$content.find('.username-input');
                    var password = this.$content.find('.password-input');
                    var confirmpassword = this.$content.find('.confirmpassword-input');
                    var checkbox = this.$content.find('.checkbox-input').is(':checked') ? 1 : 0;
                    if (!firstname.val().trim() || !lastname.val().trim() || !email.val().trim() || !contactno.val().trim() || !username.val().trim() || !password.val().trim() || !confirmpassword.val().trim()) {
                        $.alert({
                            boxWidth: '30%',
                            useBootstrap: false,
                            content: "Please don't keep the field empty.",
                            type: 'red'
                        });
                        return false;
                    } else {

                        if (password.val() != confirmpassword.val()) {
                            $.alert({
                                boxWidth: '30%',
                                useBootstrap: false,
                                content: "password and confirm password does not match.",
                                type: 'red'
                            });
                            return false;
                        } else {

                            $.ajax({
                                url: 'UpdateStaff_Servlet?idNo=' + id + '&firstname=' + firstname.val() + '&lastname=' + lastname.val() + '&email=' + email.val() + '&contactno=' + contactno.val() + '&username=' + username.val() + '&password=' + password.val() + '&islocked=' + checkbox, // Replace with your endpoint
                                type: 'PUT', // Send the ID as data
                                success: function (response) {
                                    var ischecked = checkbox == 1 ? "Locked" : "Not Locked";
                                    var successContent = `<h3>Name: ` + firstname.val() + `<br>
                                        Lastname: ` + lastname.val() + `<br>
                                        Username: ` + username.val() + `<br>
                                        Contact Number: ` + contactno.val() + `<br>
                                        Email: ` + email.val() + `<br>
                                        Password: `+ password.val() + `<br>
                                        Restriction: `+ ischecked + `</h3>`;

                                    updateData();
                                    $.alert({
                                        boxWidth: '30%',
                                        useBootstrap: false,
                                        typeAnimated: true,
                                        type: 'green',
                                        title: 'Response : ' + response,
                                        content: successContent
                                    });
                                },
                                error: function (xhr) {
                                    $.alert({
                                        boxWidth: '30%',
                                        useBootstrap: false,
                                        type: 'red',
                                        typeAnimated: true,
                                        title: 'error',
                                        content: xhr.statusText
                                    });
                                }
                            });
                        }
                    }
                }
            },
            Close: function () {
                // do nothing.
            }
        },
        btnClass: 'btn-red',
        Close: function () {
            // do nothing.
        }
    });
}

//searchbutton
function searchTable() {
    // Declare variables
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toLowerCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none"; // Initially hide all rows
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    tr[i].style.display = ""; // Show the row if any column matches the search
                    break;
                }
            }
        }
    }
}