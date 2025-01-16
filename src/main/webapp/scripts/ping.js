function ping(){
    $.ajax({
        url: '/ping',
        method: 'GET',
        success: function(response) {
            // console.log(response); Process the response here
            if(!response.response){
                alert("Authentication Expired Please log in");
                window.location.href = window.location.origin + "/"; 
                setTimeout(() => {
                    clearInterval(intervalId);
                    console.log('Ping interval cleared');
                }, 0);
            };
        },
        error: function(error) {
            console.log(error);
        }
    });
}


const intervalId = setInterval(ping, 20000);
