$(document).ready(function () {
    updateCounterName()
        .then(function () {
            return getAvailableQueueNUmber();
        })
        .catch(function (error) {
            console.error('Error:', error);
        });
});

function updateCounterName() {

    return new Promise(function (resolve, reject) {

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

        setTimeout(function() {
            console.log('Counter name updated');
            resolve();
        }, 1000); 
    });

}

function renderCounterListBody(data) {
    var box1 = `
            <p>-Enrollment </p>
            <h2>`+data[0].description+`</h2>
            `
    var box2 =`
            <p>-Certifications <br>-Study Load <br>-TOR</p>
            <h2>`+data[1].description+`</h2>
             `

    var box3 =`
            <p>-Submit documents</p>
            <h2>`+data[2].description+`</h2>
            `

    $('#box1').html(box1);
    $('#box2').html(box2);
    $('#box3').html(box3);
}
//---------------------------------------- END OF COUNTERLIST

/*
Summary: check studentinput if it is in correct pattern
*/
let generalStudentInput = document.getElementById('general-student-id');
const numberRegex = new RegExp("^000$");
let generalStudentIdNoInput = document.querySelector(".student-id-no-text");
generalStudentInput.addEventListener("input", checkInput);
function checkInput() {
    if (generalStudentInput.value.match(numberRegex) == null) {
        generalStudentIdNoInput.style.color = "red";
        generalStudentIdNoInput.innerHTML = "Type '000' for new student";
    } else {
        generalStudentIdNoInput.style.color = "black";
        generalStudentIdNoInput.innerHTML = "Student ID No.";
    }
}

// Get all the modals
var generalModal = document.getElementById("general-modal");
var recordsModal = document.getElementById("records-modal");
var archivingModal = document.getElementById("archiving-modal");

// Get the buttons (cards)
var generalBtn = document.getElementById("general-card");
var recordsBtn = document.getElementById("records-card");
var archivingBtn = document.getElementById("archiving-card");

// Get the close elements for each modal
var closeButtons = document.getElementsByClassName("close");

// Function to close modal
function closeModal(modal) {
    modal.style.display = "none";
}

// Open General modal
generalBtn.onclick = function () {
    generalModal.style.display = "block";
}

// Open Records modal
recordsBtn.onclick = function () {
    recordsModal.style.display = "block";
}

// Open Archiving modal
archivingBtn.onclick = function () {
    archivingModal.style.display = "block";
}

// Function to close modal
function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";
}

// Close the modal when the close (X) is clicked
var closeButtons = document.getElementsByClassName("close");
for (var i = 0; i < closeButtons.length; i++) {
    closeButtons[i].onclick = function () {
        var modal = this.closest('.modal'); // Find the closest modal container
        modal.style.display = "none";
    };
}

// Close modal when clicking outside of it
window.onclick = function (event) {
    var modals = document.getElementsByClassName('modal');
    for (var i = 0; i < modals.length; i++) {
        if (event.target == modals[i]) {
            modals[i].style.display = "none";
        }
    }
}



//this is for setting queue limit
let currentQueueCount = 0;

// Function to check if the queue is still open based on the limit
function checkQueueLimit() {
    const limit = localStorage.getItem('dailyQueueLimit') || 10000;  // SET 10000 NI NAKO NAKADEPENDE NILA KAY NO LIMIT SILA MO HANDLE UG REQUEST
    if (currentQueueCount >= limit) {
        $.notify("Sorry, the queue for today is full. Please come back tomorrow.", { color: "#fff", background: "#D44950", delay: 1000 })
        return false;
    }
    return true;
}

//need to polish --- BUG: TOO MANY CONNECTIONS PARTIAL FIX
var queueNumber = 1;
var startAvailQueueCount = false;
function getAvailableQueueNUmber(){

    return new Promise(function (resolve, reject) {

        $.ajax({
            url: 'JsonQueueNumberAvailableAPI?availableNumber=' + queueNumber,
            type: "GET",
            success: function (response) {

                queueNumber = response.id;

                //TODO update puhon kay naka shortpoll pako hehe
                //sendMsg("update queue");

                startAvailQueueCount = true;

            },
            error: function (xhr, status, error) {
                $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
            }
        });

        setTimeout(function() {
            console.log('Counter name updated');
            resolve(); 
        }, 1000);
    });
}

var isRunning = false;
// Function to print the queue and check if limit is reached
async function printQueue(serviceType) {

    //PREVENT FROM DOUBLE REQUEST
    if (isRunning) {
        isRunning = false;
        return;
    }
    isRunning = true;

    //E INCREMENT KAY MO BUG FIX NALANG NI LATOR
    if(!startAvailQueueCount)
        queueNumber++;

    //SET TO FALSE IF MAG FIRST QUEUE 
    startAvailQueueCount = false;

    let studentName = '';
    let studentId = '';
    let purpose = '';
    let charQueue = '';
    let studentFirstname = '';
    let studentMiddlename = '';
    let studentLastname = '';
    let yearLevel = ''
    let program = '';

    if (serviceType === 'General') {
        studentFirstname = document.getElementById('general-student-firstname');
        studentMiddlename = document.getElementById('general-student-middlename');
        studentLastname = document.getElementById('general-student-lastname');
        yearLevel = document.getElementById('yearLevel');
        studentId = document.getElementById('general-student-id');
        purpose = document.getElementById('general-purpose');
        program = document.getElementById('general-program');

        charQueue = 'G';
    } else if (serviceType === 'Records') {
        studentName = document.getElementById('records-student-name');
        studentId = document.getElementById('records-student-id');
        purpose = document.getElementById('records-purpose');
        charQueue = 'R';
    } else if (serviceType === 'Archiving') {
        studentFirstname = document.getElementById('archiving-student-firstname');
        studentMiddlename = document.getElementById('archiving-student-middlename');
        studentLastname = document.getElementById('archiving-student-lastname');

        studentId = document.getElementById('archiving-student-id');
        purpose = document.getElementById('archiving-purpose');
        charQueue = 'A';
    }


    // Generate random queue number and current date
    var currentDateTime = new Date().toLocaleString();

    studentName = studentFirstname.value + " " + studentMiddlename.value + " " + studentLastname.value;

    if (studentName.trim() === "undefined undefined undefined") {
        studentName = '';
        studentName = document.getElementById('records-student-name').value;
    }

    // Create the receipt content
    var receiptContent = `
                    <center><h3>CEBU EASTERN COLLEGE</h3></center>
                    <center><h4>QUEUEING NO.</h4></center>
                    <hr>
                    <h1>`+ (charQueue + queueNumber) + `</h1>
                    <hr>
                    <p><strong>Name:</strong> `+ studentName + `</p>
                    <p><strong>Student ID:</strong> `+ studentId.value + `</p>
                    <p><strong>Service Type:</strong> ` + serviceType + ` Service</p>
                    <p><strong>Purpose:</strong> `+ purpose.value + `</p>
                    <p><strong>Date & Time:</strong> `+ currentDateTime + `</p>
                    `;
    let servetype = serviceType;

    await $.ajax({
        url: 'inquiry',
        type: 'POST',
        data: {
            queueNum: (charQueue + queueNumber),
            fullname: studentName,
            studentid: studentId.value,
            purpose: purpose.value,
            servicetype: servetype,
            program: program.value
        },
        success: function (response) {
            $.notify(response, { color: "#fff", background: "#20D67B", delay: 500 })

            // Inject the receipt content into the modal
            document.getElementById('printArea').innerHTML = receiptContent;

            // Show the modal
            var modal = document.getElementById('receiptModal');
            modal.style.display = "block";


            // Automatically print the receipt content
            setTimeout(function await() {
                window.print();
            }, 500); // Optional delay before printing

            if (serviceType === 'General') {
                studentFirstname.value = "";
                studentMiddlename.value = "";
                studentLastname.value = "";
                yearLevel.value = "";
                studentId.value = "";
                purpose.value = "";
                program.value = "";
            } else if (serviceType === 'Records') {
                document.getElementById('records-student-name').value = "";
                studentId.value = "";
                purpose.value = "";
            } else if (serviceType === 'Archiving') {
                studentFirstname.value = "";
                studentMiddlename.value = "";
                studentLastname.value = "";
                studentId.value = "";
                purpose.value = "";
            }

        },
        error: function (xhr, status, error) {
            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })

        }
    });
}

// Close the modal when the user clicks the "close" button
function closeModal() {
    var modal = document.getElementById('receiptModal');
    modal.style.display = "none";
}

// ---------------------records 
const recordsButton = document.getElementById("recordsbutton");
recordsButton.addEventListener("mouseenter", event => {
    //console.log("records-student-id");
    studentId = document.getElementById('records-student-id');
    let studentName = document.getElementById('records-student-name');

    $.ajax({
        url: 'JsonStudentSearchAPI',
        type: 'GET',
        data: {
            studentid: studentId.value,
            firstname: "none",
            middlename: "none",
            lastname: "none"
        },
        success: function (response) {
            if (response == null) {
                studentName.value = "";
            }
            studentName.value = response.firstname + " " + response.middlename + " " + response.lastname;
            console.log(response)
            //alert('Success: ' + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
            studentName.value = "";
            //alert(error + ' : ' + xhr.responseText);
        }
    });
});

// ----------------- archiving
archiveStudentId = document.getElementById('archiving-student-id');
let archivingStudentFirstName = document.getElementById('archiving-student-firstname');
let archivingStudentMiddleName = document.getElementById('archiving-student-middlename');
let archivingStudentLastName = document.getElementById('archiving-student-lastname');

const archivingButton = document.getElementById("archivingButton");

archivingButton.addEventListener("mouseover", event => {
    if (archiveStudentId.value != "") {
        firstCall();
    } else if (archivingStudentFirstName.value != "" && archivingStudentLastName.value != "") {
        secondCall();
    }

    function firstCall() {
        $.ajax({
            url: 'JsonStudentSearchAPI',
            type: 'GET',
            data: {
                studentid: archiveStudentId.value,
                firstname: "none",
                middlename: "none",
                lastname: "none"
            },
            success: function (response) {
                if (response == null) {
                    SetEmptyNameFields();
                }
                archivingStudentFirstName.value = response.firstname;
                archivingStudentMiddleName.value = response.middlename;
                archivingStudentLastName.value = response.lastname;
                archiveStudentId.value = response.idnumber;
                // studentName.value = response.firstname + " " +  response.middlename + " " +  response.lastname;
                // console.log(response)
                //alert('Success: ' + response.idnumber + " " + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
            },
            error: function (xhr, status, error) {
                //archivingStudentName.value = "";
                $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                SetEmptyNameFields();
            }
        });
    }

    function secondCall() {
        $.ajax({
            url: 'JsonStudentSearchAPI',
            type: 'GET',
            data: {
                studentid: 999999999,
                firstname: archivingStudentFirstName.value,
                middlename: archivingStudentMiddleName.value,
                lastname: archivingStudentLastName.value
            },
            success: function (response) {
                if (response == null) {
                    SetEmptyNameFields();
                }
                archiveStudentId.value = response.idnumber;
                archivingStudentFirstName.value = response.firstname;
                archivingStudentMiddleName.value = response.middlename;
                archivingStudentLastName.value = response.lastname;
                // studentName.value = response.firstname + " " +  response.middlename + " " +  response.lastname;
                // console.log(response)
                //alert('Success: ' + response.idnumber + " " + response.firstname + " " + response.middlename + " " + response.lastname + " " + response.course);
            },
            error: function (xhr, status, error) {
                //archivingStudentName.value = "";
                $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
                SetEmptyNameFields();
            }
        });
    }

});

function SetEmptyNameFields() {
    archivingStudentFirstName.value = "";
    archivingStudentMiddleName.value = "";
    archivingStudentLastName.value = "";
}


//Selection
//Selection
function InquirySelection() {
    generalitemId = 1;
    recordsitemId = 1;
    archivingItemId = 1;
    $.ajax({
        url: '/JsonServiceListAPI',
        method: 'GET',
        data: {},
        dataType: 'json',
        success: function (data) {
            const selectGeneralProgramBody = $('#general-program');
            const tableGeneralPurposeBody = $('#general-purpose');
            const tableRecordsPurposeBody = $('#records-purpose');
            const tableArchivePurposeBody = $('#archiving-purpose');

            //selectGeneralProgramBody.empty();
            //tableGeneralPurposeBody.empty();
            //tableRecordsPurposeBody.empty();
            //tableArchivePurposeBody.empty();

            // Populate table with new data
            data.forEach(item => {

                if (item.course !== undefined && item.serviceType == 'GENERAL') {
                    selectGeneralProgramBody.append(`
                                     <option value="`+ item.course + `">` + item.course + `</option>
               					`);
                }
                else if (item.purpose !== undefined && item.serviceType == 'GENERAL') {
                    tableGeneralPurposeBody.append(`
									      <option value="`+ item.purpose + `">` + item.purpose + `</option>
								`);
                }

                if (item.purpose !== undefined && item.serviceType == 'RECORDS') {
                    tableRecordsPurposeBody.append(`
									        <option value="`+ item.purpose + `">` + item.purpose + ` [Php` + item.amount + `.00]</option>
								`);
                }
                else if (item.program === undefined && item.serviceType == 'ARCHIVING') {
                    tableArchivePurposeBody.append(`
									 <option value="`+ item.purpose + `">` + item.purpose + `</option>
								`);
                }

            });
        },
        error: function (error) {
            $.notify("Error fetching data " + error, { color: "#fff", background: "#D44950", delay: 1000 })
        }
    });
}

InquirySelection();

//websocket
var wsUrl;
if (window.location.protocol == 'http:') {
    wsUrl = 'ws://';
} else {
    wsUrl = 'wss://';
}
var ws = new WebSocket(wsUrl + window.location.host + "/queueupdate");

ws.onopen = function (event) {
    console.log('WebSocket connection opened', event);
};

//bug problem - mo undefined inig inquire sa userinquiry
function sendMsg(response) {
    if (response) {
        ws.send(JSON.stringify({
            message: response
        }));
        //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
    }
}



//On-screen keyboard
document.querySelectorAll('input').forEach(input => {
    input.addEventListener('focus', () => {
        input.click(); // Ensures compatibility with certain touch systems
    });
});