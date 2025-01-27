//-----------------------------------------------------------------------------------CRUD COUNTERLIST
var counterbtnform = document.getElementById("counterSubmitBtn");
//counterlistbody
$(document).ready(function () {
    updateCounterList();
});

// GET ALL LISTS
function updateCounterList() {
    fetch(window.location.origin + '/CounterlistApi')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            renderCounterListBody(data);
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
}

function renderCounterListBody(data) {
    var htmlString = ``;
    data.forEach(item => {
        htmlString += `
        <tr>
        <td>`+ item.counterNumber + `</td>
        <td>`+ item.description + `</td>
        <td>`+ item.dateCreated + `</td>
        <td>`+ item.status + `</td>
        <td>
        <button class="btn update" onclick="UpdateDeleteCounterList(`+item.id+`, `+item.counterNumber+`, '`+item.description+`', '`+item.status+`', 'PUT', 'btn-blue', 'Update', 'Update Counter')">Update</button>
        <button class="btn delete" onclick="UpdateDeleteCounterList(`+item.id+`, `+item.counterNumber+`, '`+item.description+`', '`+item.status+`', 'DELETE', 'btn-red', 'Delete', 'Delete `+item.description+`?')">Delete</button>
        </td>
        </tr>
        `
    });

    $('#counterListBody').html(htmlString);
}

// ADD COUNTERLIST
    $('#counterRegisterForm').on('submit', function (event) {
        event.preventDefault();
        let formData = $(this).serialize();

    $.ajax({
        url: '/CounterlistApi',
        type: 'POST',
        data: formData,
        beforeSend: function () {
            $.notify('processing request', { color: "#fff", background: "#20D67B", delay: 1000 })
        },
        success: function (response) {
            $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
            updateCounterList();
        },
        error: function (xhr, status, error) {
            $.notify('error : ' + xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
            updateCounterList();
        }
    });
});

counterbtnform.addEventListener("click", function () {
    counterbtnform.disabled = true;
    $('#counterRegisterForm').submit();
    counterbtnform.disabled = false;
});

//UPDATE | DELETE COUNTERLIST
function UpdateDeleteCounterList(id, counterNumber, description, status, method, btnColor, btnText, title){ 

    let contents = ``;

    if(method == 'PUT'){
        contents = 
        `
        <form class="formName">
        <div class="form-group">
        
        <label>Counter no</label>
        <input type="number" placeholder="Enter counter no." id="counterNumberText" class="name form-control" value=`+counterNumber+` required />
        
        <label>Description</label>
        <input type="text" placeholder="Enter description" id="descriptionText" class="name form-control" value=`+description+` required />

        <label>Id no.</label>
        <input type="text" id="idText" placeholder="Your name" class="name form-control" value="`+id+`" required/>

        <label for="cars">Status</label>

        <select class="name form-control" id="status" required>
        <option value="`+status+`">`+status+`</option>
        <option value="inactive">inactive</option>
        </select>
        </div>
        </form>
        `;
    }
 
    if(method == 'DELETE'){
        contents =
        `
        <form class="formName">
        <div class="form-group">
        <label>Id no.</label>
        <input type="text" id="idText" placeholder="Your name" class="name form-control" value="`+id+`" required/>
        </div>
        </form>
        `;
    }

    $.confirm({
        title: title,
        content: contents,
        boxWidth: '35%',
        type: 'blue',
        useBootstrap: false,
        buttons: {
            formSubmit: {
                text: btnText,
                btnClass: btnColor,
                action: function () {
                    let counterNumber = this.$content.find('#counterNumberText').val();
                    let description = this.$content.find('#descriptionText').val();
                    let id = this.$content.find('#idText').val();
                    let status = this.$content.find('#status').val();

                    if((!counterNumber || !description || !id || !status) && method == 'PUT'){
                        $.alert('fill the blank spaces');
                        return false;
                    }
                    
                    if(!id && method == 'DELETE'){
                        $.alert('fill the blank spaces');
                        return false;
                    }

                    $.ajax({
                        url: window.location.origin + '/CounterlistApi',
                        method: method,
                        contentType: 'application/json',
                        data: JSON.stringify({ 
                            counterNumber: counterNumber,
                            description: description,
                            id: id,
                            status: status
                        }),
                        success: function(response) {
                            $.notify(response.message, { color: "#fff", background: "#20D67B", delay: 1000 })
                            updateCounterList();

                        },
                        error: function(xhr, status, error) {
                            $.notify(xhr.statusText + ' : ' + xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                            updateCounterList();
                        }
                    });
                }
            },
            cancel: function () {
                //close
            },
        }
    });
}

//------------------------------------------------------------------------------------  END OF FUNCTION

var dropdown = document.getElementsByClassName("button-profile");
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

var dropdown = document.getElementsByClassName("button-profile");
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

//button-profile being active btn
document.getElementById('button-profile').addEventListener('click', function () {
    this.classList.toggle('active');
    document.getElementById('adminProfile').classList.toggle('show');
});



//notification
const notificationIcon = document.getElementById('notifications');
const notificationDropdown = document.getElementById('notificationDropdown');
const notificationBadge = document.getElementById('notificationBadge');
const markAllRead = document.getElementById('markAllRead');
const unreadItems = document.querySelectorAll('.dropdown-item.unread');

// Toggle dropdown visibility
notifications.addEventListener('click', () => {
    notificationDropdown.classList.toggle('active');
});

// Close dropdown when clicking outside
document.addEventListener('click', (event) => {
    if (!notifications.contains(event.target) && !notificationDropdown.contains(event.target)) {
        notificationDropdown.classList.remove('active');
    }
});

// Update badge count
const updateBadgeCount = () => {
    const unreadCount = document.querySelectorAll('.dropdown-item.unread').length;
    notificationBadge.textContent = unreadCount;
    notificationBadge.style.display = unreadCount > 0 ? 'flex' : 'none';
};

// Mark all notifications as read
markAllRead.addEventListener('click', () => {
    unreadItems.forEach(item => item.classList.remove('unread'));
    updateBadgeCount();
});

// Initialize badge count
updateBadgeCount();