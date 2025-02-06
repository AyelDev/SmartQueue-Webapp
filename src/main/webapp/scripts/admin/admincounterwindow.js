function updateTime() {
    const now = new Date();
     document.getElementById('date').textContent = now.toLocaleDateString();
     document.getElementById('time').textContent = now.toLocaleTimeString();
}
updateTime();
setInterval(updateTime, 1000);

let counterList = document.getElementById("counter-list");
document.addEventListener("DOMContentLoaded", event => {
    $.ajax({
        url: '/JsonAvailableWindow',
        method: 'GET',
        data: {},
        dataType: 'json',
        success: function (data) {
            const selectCounterListBody = $('#counter-list');
            selectCounterListBody.empty();
            selectCounterListBody.append(`
            <option value="0">CHOOSE COUNTER WINDOW</option>`);
            data.forEach(item => {
                selectCounterListBody.append(`
                     <option value="`+ item.window_number + `">Counter-Window : ` + item.window_number + ` - ` + item.serviceType + `</option>`);
            });
        }

    });
});

async function counterChangeListOnChange() {

    // document.getElementById("priority-number-table").innerHTML = `
    //    <tr>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                     </tr>
    // `;

    // document.getElementById("counter-access-table").innerHTML = `
    //    <tr>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                         <td><div class="tloader"></div></td>
    //                     </tr>
    // `;

    await CounterList(counterList.value, "QUEUE", '#priority-number-table');
    await CounterList(counterList.value, "SERVING", '#counter-access-table');
}

async function CounterList(window_nunber, queue_status, elementid) {
    await $.ajax({
        url: '/JsonStudentQueueEntriesAPI',
        method: 'GET',
        data: {
            window_number: window_nunber,
            queue_status: queue_status
        },
        dataType: 'json',
        success: function (data) {
            let prioriyNumberTable = $(elementid);
            prioriyNumberTable.empty();
            data.forEach(item => {
                prioriyNumberTable.append(`
                    <tr>
                        <td>`+ item.queue_number + `</td>
                        <td>`+ item.purpose + `</td>
                        <td>`+ item.fullname + `</td>
                        <td>`+ item.id_number + `</td>
                        <td>`+ item.date + `</td>
                        <td>`+ item.queue_status + `</td>
                        <td>`+ item.window_number + `</td>
                    </tr>
                     `);
            });
        }

    });
}

setInterval(counterChangeListOnChange, 3000); //change to websocket

let priorityNumberTableBody = document.getElementById("priority-number-table");
let counterAccessTableBody = document.getElementById("counter-access-table");
const callButton = document.getElementById("call-button");
const recallButton = document.getElementById("recall-button");
const doneButton = document.getElementById("done-button");

async function transferRow() {

    callButton.disabled = true;
    callButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

    setTimeout(() => {
        callButton.disabled = false;
        callButton.innerHTML = `<b>CALL</b>`;
    }, 1000);

    if (counterAccessTableBody.rows.length > 0) {
        await $.notify("Table 2 can only hold one row!", { color: "#fff", background: "#D44950", delay: 1000 })
        return;
    }

    if (priorityNumberTableBody.rows.length > 0) {

        let firstRow = priorityNumberTableBody.rows[0];
        await counterAccessTableBody.appendChild(firstRow);
        let queueNumber = firstRow.cells[0].innerText;
        let window_number = firstRow.cells[6].innerText;
        await sendMsg(queueNumber, window_number);
        await updateQueueStatus(queueNumber, 'SERVING');
    } else {
        await $.notify("No more rows to transfer!", { color: "#fff", background: "#D44950", delay: 1000 });
    }
}

function removeRow() {
    doneButton.disabled = true;
    doneButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

    setTimeout(() => {
        doneButton.disabled = false;
        doneButton.innerHTML = `<b>DONE</b>`;
    }, 1000);

    if (counterAccessTableBody.rows.length > 0) {
        let secondRow = counterAccessTableBody.rows[0];
        let queueNumber = secondRow.cells[0].innerText;
        updateQueueStatus(queueNumber, 'DONE');
        counterAccessTableBody.deleteRow(0);
    } else {
        $.notify("No row to remove from Table 2!", { color: "#fff", background: "#D44950", delay: 1000 })
    }
}

function recall() {

    recallButton.disabled = true;
    recallButton.innerHTML = `<b>LOADING</b> <span id="button-loader"></span>`;

    setTimeout(() => {
        recallButton.disabled = false;
        recallButton.innerHTML = `<b>RECALL</b>`;
    }, 1000);

    if (counterAccessTableBody.rows.length > 0) {
        let secondRow = counterAccessTableBody.rows[0];
        let queueNumber = secondRow.cells[0].innerText;
        let window_number = secondRow.cells[6].innerText;
        sendMsg(queueNumber, window_number);
    } else {
        $.notify("No row to recall from Table 2!", { color: "#fff", background: "#D44950", delay: 1000 })
    }
}

//update queue status
function updateQueueStatus(queueNumber, queueStatus) {
    $.ajax({
        url: `/updateQueueStatus?queueNumber=` + queueNumber + `&queueStatus=` + queueStatus,
        type: 'PUT',
        success: function (response) {
            $.notify(response, { color: "#fff", background: "#20D67B", delay: 1000 })
        }, error: function (xhr, status, error) {
            $.notify(xhr.responseText, { color: "#fff", background: "#D44950", delay: 1000 })
        }
    });
}

//websocket
var wsUrl;
if (window.location.protocol == 'http:') {
    wsUrl = 'ws://';
} else {
    wsUrl = 'wss://';
}
var ws = new WebSocket(wsUrl + window.location.host + "/QueueWebSocketController");

ws.onopen = function (event) {
    console.log('WebSocket connection opened', event);
};

function sendMsg(queueNumber, window_number) {
    if (queueNumber) {
        ws.send(JSON.stringify({
            message: "Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you",
            queueNumber: queueNumber,
            windowNumber: window_number,
            tostop: "none"
        }));
        //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
    }
}

var ws2 = new WebSocket(wsUrl + window.location.host + "/queueupdate");

ws2.addEventListener("message", async (message) => {
    await $.notify("loading new requests...", { color: "#fff", background: "#20D67B", delay: 1000 })
    await CounterList(counterList.value, "QUEUE", '#priority-number-table');
})


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

//CALL CUSTOM NAME
function CallName(){
    var name = document.querySelector('.custom-call');
    if(name.value !== '' && counterList.value > 0){
        alert("calling " + name.value);
            ws.send(JSON.stringify({
                message: "Attention. " + name.value + ". Please Proceed to window " + counterList.value + ". Thank you",
                queueNumber: name.value,
                windowNumber: counterList.value,
                tostop: "none"
            }));
            //ws.send("Attention. Queue Number," + queueNumber + ". Please Proceed to window " + window_number + ". Thank you");
    }else{
        alert("Empty name or counter window not set.");
    }

    document.querySelector('.custom-call').value = ''; //clear name after call
}