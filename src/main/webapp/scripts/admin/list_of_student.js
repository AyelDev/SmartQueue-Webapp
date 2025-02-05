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
    request.open('GET', '/JsonStudentListAPI');
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

        htmlString += "<tr>";
        htmlString += "<td>" + data[i].idnumber + "</td>";
        htmlString += "<td>" + data[i].firstname + " " + data[i].middlename + " " + data[i].lastname + " </td>";
        htmlString += "<td>" + data[i].course + "</td>";
        htmlString += '<td><button onclick="updateStudent(' + data[i].idnumber + ', \'' + data[i].firstname + '\', \'' + data[i].middlename + '\', \'' + data[i].lastname + '\', \'' + data[i].course + '\')" class="update" style="background-color: #0056b3; color: white;">Update</button> ';
        htmlString += '<button onclick="removeStudent(' + data[i].idnumber + ')" button class="delete" style="background-color: #EE4E4E; color: white;">Delete</button>';
        htmlString += "</tr>";
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



// Event listeners
addAccountButton.addEventListener('click', openModal);
closeModalButton.addEventListener('click', closeModal);
overlay.addEventListener('click', closeModal);

$(document).ready(function () {
    $('#studentRegisterForm').on('submit', function (event) {
        event.preventDefault(); // Prevent the default form submission

        // Create a new AJAX request
        var url = 'studentRegister_Servlet';

        // Prepare the POST request with form data
        var params = $(this).serialize();

        $.ajax({
            url: url,
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: params,
            success: function (response) {
                closeModal()
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
                closeModal()
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


//delete student
function removeStudent(id) {
    $.confirm({
        boxWidth: '30%',
        useBootstrap: false,
        type: 'blue',
        typeAnimated: true,
        title: 'Delete student : ' + id + '?',
        content: 'This dialog will automatically trigger \'cancel\' in 10 seconds if you don\'t respond.',
        autoClose: 'cancel|10000',
        buttons: {
            deleteUser: {
                text: 'delete user',
                btnClass: 'btn-red',
                action: function () {
                    // Create the AJAX request
                    $.ajax({
                        url: 'RemoveStudent_Servlet?idNo=' + id, // Replace with your endpoint
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

//update student
function updateStudent(id, firstname, middlename, lastname, course) {
    $.confirm({
        type: 'blue',
        boxWidth: '50%',
        boxHeight: '9	0%',
        useBootstrap: false,
        title: 'Update Student : ' + id,
        content: `
                <div class="register-form">
                <form id="studentRegisterForm">
                    <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                        <input class="firstname-input" required="required" type="text"
                            name="txtFirstname" value="`+ firstname + `"> <label for="firstname"
                            class="firstname-label">First name</label>
                    </div>
                    <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                        <input class="middlename-input" required="required" type="text"
                            name="txtMiddlename" value="`+ middlename + `"> <label for="middlename"
                            class="middlename-label">Middle name</label>
                    </div>

                    <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">
                        <input class="lastname-input" required="required" type="text"
                            name="txtLastname" value="`+ lastname + `"> <label for="lastname" class="lastname-label">Last
                            name</label>
                    </div>

                    <div class="input-container" style="width: 40%; margin: 0 20px 0 20px;">

                        <select name="purpose" class="purpose">
                            <option value="`+ course + `" disabled selected hidden>` + course + `</option>
                            <option value="BEED">BEED</option>
                            <option value="BSHM">BSHM</option>
                            <option value="BSIT">BSIT</option>
                            <option value="BSTM">BSTM</option>
                            <option value="BSED">BSED</option>
                            <option value="BSCRIM">BSCRIM</option>
                        </select>
                    </div>
                    <div class="input-container" style="width: 40%; margin: 0 20px 5% 20px;">
                        <input id="id-input" class="lastname-input" required="required" type="text"
                            name="txtIdnumber" value="`+ id + `"> <label for="lastname" class="lastname-label">Id
                            number</label>
                    </div>

                </form>
            </div>`,
        buttons: {
            sayMyName: {
                text: 'Update',
                btnClass: 'btn-green',
                action: function () {

                    var studentId = this.$content.find('#id-input');
                    var firstname = this.$content.find('.firstname-input');
                    var middlename = this.$content.find('.middlename-input');
                    var lastname = this.$content.find('.lastname-input');
                    var courses = this.$content.find('.purpose');

                    //no use line
                    // var errorText = this.$content.find('.text-danger');

                    if (!studentId.val().trim() || !firstname.val().trim() || !lastname.val().trim()) {
                        $.alert({
                            boxWidth: '30%',
                            useBootstrap: false,
                            content: "Please don't keep the name field empty.",
                            type: 'red'
                        });
                        return false;
                    } else {
                        var coursecheck = courses.val() == null ? course : courses.val();
                        $.ajax({
                            url: 'UpdateStudent_Servlet?idnum=' + id +
                                '&inputidnum=' + studentId.val() +
                                '&firstname=' + firstname.val() +
                                '&middlename=' + middlename.val() +
                                '&lastname=' + lastname.val() +
                                '&course=' + coursecheck,
                            type: 'PUT',
                            success: function (response) {
                                var successContent = `<h3>Student Number : ` + studentId.val() + `<br>
                                        Firstname : ` + firstname.val() + `<br>
                                        Middle : ` + middlename.val() + `<br>
                                        Lastname : ` + lastname.val() + `<br>
                                        Course : ` + coursecheck + `</hr>`;

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
            },
            Close: function () {
                // do nothing.
            }
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