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

/* <summary>
CHARTJS.....	
</summary>*/
let hsNum, shsNum, Num;
let BSIT = 0;
let BEED = 0;
let BSTM = 0;
let BSHM = 0;
let BSCRIM = 0;
let BSED = 0;

let inquiryToday = 0;

let months = [0,0,0,0,0,0,0,0,0,0,0,0];

//fetch according to todays time, date, year
//--current date
const date = new Date();

const options = { year: 'numeric', month: 'short', day: 'numeric' };
const formattedDate = date.toLocaleDateString('en-PH', options);

Promise.all([
    fetch('/JsonStaffListAPI'),
    fetch('/JsonStudentListAPI'),
	fetch('/getallentries'),
	fetch('/JsonListMonthlyQueueEntries'),
	
    // fetch('http://localhost:8080/smartqueueweb/JsonInquiryListAPI')
])
    .then(responses => {
        responses.forEach(response => {
            if (!response.ok) {
                throw new Error('Network response problem' + response.statusText);
            }
        });
        return Promise.all(responses.map(response => response.json()));
    })
    .then(data => {
        staffNum = data[0].length; // Staff count
        studentNum = data[1].length; // Student count
        inquiryNum = data[2].length; // Inquiry count
		

        data[1].forEach(item => {
			switch (true) {
			    case item.course.includes('BSIT'):
			        BSIT++;
			        break;
			    case item.course.includes('BEED'):
			        BEED++;
			        break;
			    case item.course.includes('BSED'):
			        BSED++;
			        break;
			    case item.course.includes('BSTM'):
			        BSTM++;
			        break;
			    case item.course.includes('BSHM'):
			        BSHM++;
			        break;
			    case item.course.includes('BSCRIM'):
			        BSCRIM++;
			        break;
				}
        });
		
		data[2].forEach(item => {
			//TOTAL QUEUE FOR TODAY
			if (item.DateInquired.includes(formattedDate)){
				inquiryToday++;		
			}
		});

        document.getElementById("total-student").innerHTML = studentNum;
        document.getElementById("total-bsit-student").innerHTML = BSIT;
        document.getElementById("total-beed-student").innerHTML = BEED;
        document.getElementById("total-bsed-student").innerHTML = BSED;
        document.getElementById("total-bstm-student").innerHTML = BSTM;
        document.getElementById("total-bshm-student").innerHTML = BSHM;
        document.getElementById("total-crim-student").innerHTML = BSCRIM;   

        // document.getElementById("total-staff").innerHTML = staffNum;
        document.getElementById("total-transaction").innerHTML = inquiryToday;
		
        //count 0 to n animation
        $('.counts').each(function () {
            $(this).prop('Counter', -1).animate({
                Counter: $(this).text()
            }, {
                duration: 2000,
                easing: 'swing',
                step: function (now) {
                    $(this).text(Math.ceil(now));
                }
            });
        });
        BarGraph(
            data[3][0].inquiries,
            data[3][1].inquiries,
            data[3][2].inquiries,
            data[3][3].inquiries,
            data[3][4].inquiries,
            data[3][5].inquiries,
            data[3][6].inquiries,
            data[3][7].inquiries,
            data[3][8].inquiries,
            data[3][9].inquiries,
            data[3][10].inquiries,
            data[3][11].inquiries);
        console.log(studentNum, staffNum, inquiryNum); // Use as needed
       // BarGraph(months[0], months[1], months[2], months[3], months[4], months[5], months[6], months[7], months[8], months[9], months[10], months[11]);
    /*    myChart(studentNum, staffNum, inquiryNum);
        PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM)*/
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
    });

let delayed;
function myChart(studentNum, staffNum, inquiryNum) {
    const ctx = document.querySelector('#myChart');


    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Students', 'Staff', 'Inquiry Today'],
            datasets: [{
                labels: ['Students', 'Staff', 'Inquiry'],
                data: [studentNum, staffNum, inquiryNum],
                backgroundColor: [
                    '#A0E9FF',
                    '#2f5f98',
                    '#2d8bba'
                ],
                borderWidth: 2
            }]
        },
        options: {
            animation: {
                onComplete: () => {
                    delayed = true;
                },
                delay: (context) => {
                    let delay = 0;
                    if (context.type === 'data' && context.mode === 'default' && !delayed) {
                        delay = context.dataIndex * 2000 + context.datasetIndex * 400;
                    }
                    return delay;
                },
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM) {
    const ctz = document.querySelector('#myPie');
    let pattern;
    new Chart(ctz, {
        type: 'doughnut',
        data: {
            labels: ['BSIT', 'BEED', 'DEVCOM', 'BSTM', 'BSHM'],
            datasets: [{
                data: [BSIT, BEED, DEVCOM, BSTM, BSHM],
                backgroundColor: [
                    '#31356e',
                    '#2f5f98',
                    '#2d8bba',
                    '#41b8d5',
                    '#6ce5e8'
                ]
            }],


        },
        options: {
            animation: {
                onComplete: () => {
                    delayed = true;
                },
                delay: (context) => {
                    let delay = 0;
                    if (context.type === 'data' && context.mode === 'default' && !delayed) {
                        delay = context.dataIndex * 300 + context.datasetIndex * 200;
                    }
                    return delay;
                },
            }
        }
    });
}

var btns = document.getElementsByClassName("dropdown-btn");
var dropdowns = document.getElementsByClassName("dropdown-dashboard");

for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        // Remove "active" class from all buttons
        for (var j = 0; j < btns.length; j++) {
            btns[j].classList.remove("active");
        }

        // Hide all dropdowns
        for (var k = 0; k < dropdowns.length; k++) {
            dropdowns[k].style.display = "none";
        }

        // Add "active" class to the clicked button
        this.classList.add("active");

        // Show the related dropdown
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent && dropdownContent.classList.contains("dropdown-dashboard")) {
            dropdownContent.style.display = "block";
        }
    });
}

// Optional: Hide dropdowns and remove active states when clicking outside the navbar
document.addEventListener("click", function (event) {
    var isClickInsideNavbar = event.target.closest(".navbar");
    if (!isClickInsideNavbar) {
        // Remove active class from all buttons
        for (var j = 0; j < btns.length; j++) {
            btns[j].classList.remove("active");
        }

        // Hide all dropdowns
        for (var k = 0; k < dropdowns.length; k++) {
            dropdowns[k].style.display = "none";
        }
    }
});

async function AddInfoError(){
    await $.notify("Please fill out the required field/fields", { color: "#fff", background: "#D44950", delay: 1000 })
}

function emptyFieldError(title, addOrDelete){
     //empty fields in General - Program
     if(title == (addOrDelete +' Program for General') && $('#program').val().trim() === ''){
        AddInfoError();
        return true;
    }
    
    //empty fields in General - Purpose
    if(title == (addOrDelete + ' Purpose for General') && $('#program').val().trim() === ''){
        AddInfoError();
        return true;
    }

    //empty fields in Records - Purpose
    if(title == (addOrDelete + ' Document for Records') && ($('#program').val().trim() === '' || $('#amount').val().trim() === '')){
        AddInfoError();
        return true;
    }

    //empty fields in Archiving - Purpose
    if(title == (addOrDelete + ' Purpose for Archiving') && $('#program').val().trim() === ''){
        AddInfoError();
        return true;
    }
}

function updateAttribute(id, programPurpose, amount){
    return [id, programPurpose, amount];
}

// Show Modal
function ModalInfo(title, context, formId, serviceType, method, updateAttribute) {

    let recordContent = ``;

    if (title == 'Add Document for Records') {
        recordContent = `
        <br><br><label for="Amount">Amount</label><br>
         <input type="number" id="amount" style="width: 60vh; height: 5vh; "  name="Amount" placeholder="Enter amount">
    `;
    }

    if(title == 'Update Document for Records'){
        recordContent = `
        <label for="Amount">Amount</label>
         <input type="number" id="amount" name="Amount" value="`+updateAttribute[2]+`" placeholder="Enter amount">
    `;
    }
    if(title == 'Delete Document for Records'){
        recordContent = `
        <label for="Amount">Amount</label>
         <input type="number" id="amount" name="Amount" value="`+updateAttribute[2]+`" placeholder="Enter amount" disabled>
    `;
    }


        //add contents
        let addContents = 
        `
        <form id="`+formId+`">
        <label for="servicetype">Service Type</label><br>
        <input type="text" id="servicetype" style="width: 60vh; height: 5vh;" name="servicetype" value="`+serviceType+`" disabled><br><br>
        <label for="`+context+`">`+context+`</label><br>
        <input type="text" id="program" style="width: 60vh; height: 5vh; " name="`+context+`" placeholder="Enter `+context+`">
        `+ recordContent + `
        </form>
        `;

        //update contents
        let updatecontents = 
        `
        <form id="`+formId+`">
        <label for="servicetype">Id No.</label>
        <input type="text" id="servicetype" name="idNo" value="`+updateAttribute[0]+`" disabled>
        <label for="`+context+`">`+context+`</label>
        <input type="text" id="program" name="`+context+`" value="`+updateAttribute[1]+`" placeholder="Enter `+context+`">
        `+ recordContent + `
        </form>
        `;

         //delete contents
         let deletecontents = 
         `
         <form id="`+formId+`">
         <label for="servicetype">Id No.</label>
         <input type="text" id="servicetype" name="idNo" value="`+updateAttribute[0]+`" disabled>
         <label for="`+context+`">`+context+`</label>
         <input type="text" id="program" name="`+context+`" value="`+updateAttribute[1]+`" placeholder="Enter `+context+`" disabled>
         `+ recordContent + `
         </form>
         `;

        if(title.includes('Add'))
        HttpRequest(addContents, title, formId, method, 'btn-green', 'Add', 'AddServices_Servlet');
        
        if(title.includes('Update'))
        HttpRequest(updatecontents, title, formId, method, 'btn-blue', 'Update', 'UpdateService_Servlet');
        
        if(title.includes('Delete')){
        HttpRequest(deletecontents, title, formId, method, 'btn-red', 'Delete', 'DeleteServices_Servlet');
        }

    }
function HttpRequest(contents, title, formId, method, btnClass, text, url){
    $.confirm({
        type: 'blue',
        boxWidth: '30%',
        useBootstrap: false,
        title: title,
        content: contents,
        buttons: {
            formField: {
                text: text,
                btnClass: btnClass,
                action: async function () {
                    let form = $('#' + formId);

                 if(emptyFieldError(title, 'Add'))
                    return false;   

                 if(emptyFieldError(title, 'Update'))
                    return false;

                 if(emptyFieldError(title, 'Delete'))
                    return false;


                    //set disable to true before sending request
                    $('#servicetype').prop('disabled', false);


                        await $.ajax({
                        url: url,
                        method: method,
                        data: form.serialize(),
                        beforeSend: function(){
                            $.notify('processing request', { color: "#fff", background: "#20D67B", delay: 1000})
                        },
                        success: function(response){
                            $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
                            updateRecordsGeneralArchivingDatas()
                        },
                         error: function(xhr, status, error){
                            $.notify("an error occured " + error,{ color: "#fff", background: "#D44950", delay: 1000 })
                        }
                    });
                }
            },
            Close: function () {
                //do nothing.
            }
        }
    });
}

function DeleteInfo(idNumber){
    $.confirm({
        title: 'Delete id no?' + idNumber,
        content: 'This dialog will automatically trigger \'cancel\' in 6 seconds if you don\'t respond.',
        autoClose: 'cancelAction|8000',
        buttons: {
            deleteUser: {
                text: 'delete user',
                action: function () {
                    $.alert('Deleted the user!');
                }
            },
            cancelAction: function () {
                $.alert('action is canceled');
            }
        }
    });
}



//fetch data for general records and archiving
function updateRecordsGeneralArchivingDatas() {
    generalitemId = 1;
    generalitempurposeId = 1;
    recordsitemId = 1;
    archivingItemId = 1;
    
    $.ajax({
        url: '/JsonServiceListAPI',
        method: 'GET',
        data: {},
        dataType: 'json',
        success: function (data) {
            const tableGeneralProgramBody = $('#general-program-tablelist');
            const tableGeneralPurposeBody = $('#general-purpose-tablelist');
            const tableRecordsPurposeBody = $('#records-purpose-tablelist');
            const tableArchivePurposeBody = $('#archiving-purpose-tablelist');

            tableGeneralProgramBody.empty();
            tableGeneralPurposeBody.empty();
            tableRecordsPurposeBody.empty();
            tableArchivePurposeBody.empty();

            // Populate table with new data
            data.forEach(item => {

                if (item.course !== undefined && item.serviceType == 'GENERAL') {
                    tableGeneralProgramBody.append(`
                    <tr>
                            <td>`+ (generalitemId++) + `</td>
                            <td>`+ item.course + `</td>
                            <td>
                            <button class="update-btn"onclick="ModalInfo('Update Program for General', 'Program', 'GeneralProgramForm', 'general', 'GET', updateAttribute(`+item.id+`, '`+item.course+`', `+item.amount+`))">Update</button>
                            <button class="delete-btn" onclick="ModalInfo('Delete Program for General', 'Program', 'GeneralProgramForm', 'general', 'GET', updateAttribute(`+item.id+`, '`+item.course+`', `+item.amount+`))">Delete</button>
                            </td>
                        </tr>
                   `);
                }
                else if (item.purpose !== undefined && item.serviceType == 'GENERAL') {
                    tableGeneralPurposeBody.append(`
                        <tr>
                            <td>`+ (generalitempurposeId++) + `</td>
                            <td>`+ item.purpose + `</td>
                            <td><button class="update-btn" onclick="ModalInfo('Update Purpose for General', 'Purpose', 'GeneralPurposeForm', 'general', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Update</button>
                                <button class="delete-btn" onclick="ModalInfo('Delete Purpose for General', 'Purpose', 'GeneralPurposeForm', 'general', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Delete</button>
                            </td>
                        </tr>
                `);
                }

                if (item.purpose !== undefined && item.serviceType == 'RECORDS') {
                    tableRecordsPurposeBody.append(`
                    <tr>
                        <td>`+ (recordsitemId++) + `</td>
                            <td>`+ item.purpose + `</td>
                                <td>Php `+item.amount+`.00</td>
                            <td><button class="update-btn" onclick="ModalInfo('Update Document for Records', 'Document', 'RecordsPurposeForm', 'records', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Update</button>
                                <button class="delete-btn" onclick="ModalInfo('Delete Document for Records', 'Document', 'RecordsPurposeForm', 'records', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Delete</button>
                            </td>
                        </tr>
                `);
                }
                else if (item.program === undefined && item.serviceType == 'ARCHIVING') {
                    tableArchivePurposeBody.append(`
                    <tr>
                            <td>`+ (archivingItemId++) + `</td>
                            <td>`+ item.purpose + `</td>
                            <td><button class="update-btn" onclick="ModalInfo('Update Purpose for Archiving', 'Purpose', 'ArchivingPurposeForm', 'archiving', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Update</button>
                                <button class="delete-btn" onclick="ModalInfo('Delete Purpose for Archiving', 'Purpose', 'ArchivingPurposeForm', 'archiving', 'GET', updateAttribute(`+item.id+`, '`+item.purpose+`', `+item.amount+`))">Delete</button>
                            </td>
                        </tr>
                `);
                }

            });
        },
        error: function (error) {
            console.error('Error fetching data:', error);
        }
    });
}
updateRecordsGeneralArchivingDatas();







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

 //----------------------------------- NEW GRAPH
 function BarGraph(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec){
	
 const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        const data = {
            labels: labels,
            datasets: [
                {
                    label: 'Inquiries',
                    data: [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec], // Replace with real data
                    backgroundColor: 'rgba(0, 0, 139, 1)',
                    borderColor: 'rgba(0, 0, 139, 1)',
                    borderWidth: 1,
                }
            ]
        };

        const config = {
            type: 'bar',
            data: data,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Monthly Queue Summary by Department'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            },
        };

        const barGraph = new Chart(
            document.getElementById('barGraph'),
            config
        );
		
}