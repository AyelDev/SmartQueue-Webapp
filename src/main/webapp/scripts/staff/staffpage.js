document.addEventListener("DOMContentLoaded", function () {
    var dropdownButton = document.querySelector(".button-profile");
    var staffProfile = document.getElementById("staffProfile");

    staffProfile.style.display = "none";

    dropdownButton.addEventListener("click", function () {
        if (staffProfile.style.display === "block") {
            staffProfile.style.display = "none";
        } else {
            staffProfile.style.display = "block";
        }
    });

    const ctx = document.getElementById('queueTrendChart').getContext('2d');
    let admissionCount = 0;
    let recordsCount = 0;
    let archiveCount = 0;

    Promise.all([
        fetch('/getallentries'),
        fetch('/JsonListMonthlyQueueEntries')
    ]).then(responses => {
        responses.forEach(response => {
            if (!response.ok) {
                throw new Error('Network response problem' + response.statusText);
            }
        });
        return Promise.all(responses.map(response => response.json()));
    }).then(data => {
        staffNum = data[0].length; // All Entries
        studentNum = data[1].length; // Monthly Entries
        
        let monthValues = [
            data[1][0].inquiries, 
            data[1][1].inquiries,
            data[1][2].inquiries,
            data[1][3].inquiries, 
            data[1][4].inquiries, 
            data[1][5].inquiries, 
            data[1][6].inquiries, 
            data[1][7].inquiries, 
            data[1][8].inquiries,
            data[1][9].inquiries, 
            data[1][10].inquiries,
            data[1][11].inquiries];
        lineChart(monthValues); 

        data[0].forEach( item =>{
            switch (true) {
            case item.serviceType.includes('General'):
                admissionCount++;
                break;
            case item.serviceType.includes('Records'):
                recordsCount++;
                break;
            case item.serviceType.includes('Archiving'):
                archiveCount++;
                break;
            }
        });

        document.getElementById("total-admission").innerHTML = admissionCount;
        document.getElementById("total-records").innerHTML = recordsCount;
        document.getElementById("total-archiving").innerHTML = archiveCount;


    })
    .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
    });

    function lineChart(monthValue) {
        let queueTrendChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"], // X-axis labels
                datasets: [{
                    label: 'Total Request', // Chart label
                    data: [monthValue[0],
                    monthValue[1],
                    monthValue[2],
                    monthValue[3],
                    monthValue[4],
                    monthValue[5],
                    monthValue[6],
                    monthValue[7],
                    monthValue[8],
                    monthValue[9],
                    monthValue[10],
                    monthValue[11]], // Replace with actual data
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: ''
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'CEC SMART QUEUE SYSTEM'
                        }
                    }
                }
            }
        });
    }
    // Calendar cd
    let currentDate = new Date();

    function renderCalendar() {
        const monthYear = document.getElementById("monthYear");
        const calendarBody = document.getElementById("calendarBody");

        const year = currentDate.getFullYear();
        const month = currentDate.getMonth();

        // Set the month and year title
        monthYear.textContent = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

        // Get the first day of the month and the number of days in the month
        const firstDay = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        // Clear the calendar body
        calendarBody.innerHTML = "";
        let row = document.createElement("tr");

        // Create empty cells before the first day of the month
        for (let i = 0; i < firstDay; i++) {
            row.appendChild(document.createElement("td"));
        }

        // Fill in the days of the month
        for (let day = 1; day <= daysInMonth; day++) {
            if (row.children.length === 7) {
                calendarBody.appendChild(row);
                row = document.createElement("tr");
            }

            const cell = document.createElement("td");
            cell.textContent = day;

            const today = new Date();
            if (day === today.getDate() && month === today.getMonth() && year === today.getFullYear()) {
                cell.classList.add("today");
            }

            cell.onclick = () => {
                document.querySelectorAll(".selected").forEach(el => el.classList.remove("selected"));
                cell.classList.add("selected");
            };

            row.appendChild(cell);
        }

        calendarBody.appendChild(row);
    }

    function changeMonth(offset) {
        currentDate.setMonth(currentDate.getMonth() + offset);
        renderCalendar();
    }
    //for previous and next button
    document.querySelector("button[onclick='changeMonth(-1)']").addEventListener('click', function () {
        changeMonth(-1); // Go to previous month
    });
    document.querySelector("button[onclick='changeMonth(1)']").addEventListener('click', function () {
        changeMonth(1); // Go to next month
    });

    // Render the initial calendar
    renderCalendar();
});