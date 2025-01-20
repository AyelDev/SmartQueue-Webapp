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

/* <summary>
CHARTJS.....	
</summary>*/
let hsNum, shsNum, Num;
let BSIT = 0;
let BEED = 0;
let DEVCOM = 0;
let BSTM = 0;
let BSHM = 0;
Promise.all([
    fetch('/JsonStaffListAPI'),
    fetch('/JsonStudentListAPI')
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
        inquiryNum = 10; // Inquiry count

        data[1].forEach(item => {
            if (item.course.includes('BSIT')) {
                BSIT++;
            }
            if (item.course.includes('BEED')) {
                BEED++
            }
            if (item.course.includes('DEVCOM')) {
                DEVCOM++
            }
            if (item.course.includes('BSTM')) {
                BSTM++
            }
            if (item.course.includes('BSHM')) {
                BSHM++
            }
        });

        document.getElementById("total-student").innerHTML = studentNum;
        document.getElementById("total-staff").innerHTML = staffNum;
        document.getElementById("total-transaction").innerHTML = inquiryNum;


        //count 0 to n animation
        $('.total-count').each(function () {
            $(this).prop('Counter', 0).animate({
                Counter: $(this).text()
            }, {
                duration: 2000,
                easing: 'swing',
                step: function (now) {
                    $(this).text(Math.ceil(now));
                }
            });
        });

        console.log(studentNum, staffNum, inquiryNum); // Use as needed

        myChart(studentNum, staffNum, inquiryNum);
        PieChart(BSIT, BEED, DEVCOM, BSTM, BSHM)
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

// Show Modal
function AddInfo(title, context, formId, serviceType, method) {

    let recordContent = ``;

    if (title == 'Add Document for Records') {
        recordContent = `
        <label for="Amount">Amount</label>
         <input type="number" id="amount" name="Amount" placeholder="Enter amount">
    `;
    }

    $.confirm({
        type: 'blue',
        boxWidth: '30%',
        useBootstrap: false,
        title: title,
        content:
        `
        <form id="`+formId+`">
        <label for="servicetype">Service Type</label>
        <input type="text" id="servicetype" name="servicetype" value="`+serviceType+`" disabled>
        <label for="`+context+`">`+context+`</label>
         <input type="text" id="program" name="`+context+`" placeholder="Enter program"><br>
        `+ recordContent + `
        </form>
        `,
        buttons: {
            formField: {
                text: 'Add',
                btnClass: 'btn-green',
                action: async function () {
                    let form = $('#' + formId);

                    //empty fields in General - Program
                    if(title == 'Add Program for General' && $('#program').val().trim() === ''){
                        AddInfoError();
                        return false;
                    }
                    
                    //empty fields in General - Purpose
                    if(title == 'Add Purpose for General' && $('#program').val().trim() === ''){
                        AddInfoError();
                        return false;
                    }

                    //empty fields in Records - Purpose
                    if(title == 'Add Document for Records' && ($('#program').val().trim() === '' || $('#amount').val().trim() === '')){
                        AddInfoError();
                        return false;
                    }

                    //empty fields in Archiving - Purpose
                    if(title == 'Add Purpose for Archiving' && $('#program').val().trim() === ''){
                        AddInfoError();
                        return false;
                    }

                    var url = 'AddServices_Servlet';
                    
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

function UpdateInfo(idNumber){

    let recordContent = ``;

    if (title == 'Add Document for Records') {
        recordContent = `
        <label for="Amount">Amount</label>
         <input type="number" id="amount" name="Amount" placeholder="Enter amount">
    `;
    }
    $.alert({
        title: 'id no.' + idNumber,
        content: 'Simple alert!',
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

//button-profile being active btn
document.getElementById('button-profile').addEventListener('click', function () {
    this.classList.toggle('active');
    document.getElementById('adminProfile').classList.toggle('show');
});


//fetch data for general records and archiving
function updateRecordsGeneralArchivingDatas(servicetype) {
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
                            <td><button class="update-btn"
                                    onclick="UpdateInfo(`+item.id+`)">Update</button>
                                <button class="delete-btn" onclick="DeleteInfo(`+item.id+`)">Delete</button>
                            </td>
                        </tr>
                   `);
                }
                else if (item.purpose !== undefined && item.serviceType == 'GENERAL') {
                    tableGeneralPurposeBody.append(`
                        <tr>
                            <td>`+ (generalitempurposeId++) + `</td>
                            <td>`+ item.purpose + `</td>
                            <td><button class="update-btn" onclick="UpdateInfo(`+item.id+`)">Update</button>
                                <button class="delete-btn" onclick="DeleteInfo(`+item.id+`)">Delete</button>
                            </td>
                        </tr>
                `);
                }

                if (item.purpose !== undefined && item.serviceType == 'RECORDS') {
                    tableRecordsPurposeBody.append(`
                    <tr>
                        <td>`+ (recordsitemId++) + `</td>
                            <td>`+ item.purpose + `</td>
                            <td><button class="update-btn" onclick="UpdateInfo(`+item.id+`)">Update</button>
                                <button class="delete-btn" onclick="DeleteInfo(`+item.id+`)">Delete</button>
                            </td>
                        </tr>
                `);
                }
                else if (item.program === undefined && item.serviceType == 'ARCHIVING') {
                    tableArchivePurposeBody.append(`
                    <tr>
                            <td>`+ (archivingItemId++) + `</td>
                            <td>`+ item.purpose + `</td>
                            <td><button class="update-btn" onclick="UpdateInfo(`+item.id+`)">Update</button>
                                <button class="delete-btn" onclick="DeleteInfo(`+item.id+`)">Delete</button>
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