const forgotPasswordButton = document.getElementById("forgotpass");
forgotPasswordButton.addEventListener("click", event => {
    $.confirm({
        type: 'blue',
        theme: 'material',
        boxWidth: '30%',
        useBootstrap: false,
        title: 'Reset Password',
        content: 
        `
             <form action="" class="formName">
             <div class="form-group">
             <br>
             <label>Enter Email</label>
             <input type="text" placeholder="Your email" class="email form-control" required />
             </div>
             </form>
        `,
        buttons: {
            formSubmit: {
                text: 'Submit',
                btnClass: 'btn-blue',
                action: function () {
                    var email = this.$content.find('.email').val();
                    if (!email) {
                        $.alert({
                            title: 'Error!',
                            type: 'red',
                            content: 'Please fill up the necessary form',
                            boxWidth: '20%',
                            useBootstrap: false,
                        });
                        return false;
                    } else {

                        $.ajax({
                        url: '/ResetPassStepOne',
                        method: 'post',
                        data: {
                        email: email
                        }
                        }).done(function (response) {

                            VerificationStepTwo(email);

                            //  self.setTitle(response.name);
                            //  self.setContentAppend('<br>' + response + '<br><br><input type="password" id="pin" placeholder="Enter PIN">');
    
                                        //  const pin = document.getElementById("pin");
    
                                        //  self.setContentAppend('<br><button type="button" id="submitPinBtn">Submit</button>');
    
                                        //  self.setButtons({}); // Remove OK and Close buttons
    
                                        //  -//---SECOND REQUEST
                                        //     $.ajax({
                                        //     url: '/ResetPassStepTwo',
                                        //     method: 'post',
                                        //     data: {
                                        //         pin: pin.value
                                        //     }
                                        //     }).done(async function (response) {
                                        //         self.setTitle(response.name);
                                        //         self.setContentAppend('<br>' + response + '<br><br>success');
        
                                        //     }).fail(function (jqXHR, error) {
                                        //         self.setContentAppend('<br>' + jqXHR.responseText);
                                        //     });
    
                            }).fail(function (jqXHR, error) {
                                //notify
                                alert(jqXHR.responseText);
                            });

                        // $.confirm({
                        //     title: 'Smartqueue Responded',
                        //     type: 'blue',
                        //     theme: 'material',
                        //     boxWidth: '30%',
                        //     useBootstrap: false,
                        //     content: function () {
                        //         var self = this;
                        //         return $.ajax({
                        //             url: '/ResetPassStepOne',
                        //             method: 'post',
                        //             data: {
                        //                 email: email
                        //             }
                        //         }).done(function (response) {
                        //             //  self.setTitle(response.name);
                        //             //  self.setContentAppend('<br>' + response + '<br><br><input type="password" id="pin" placeholder="Enter PIN">');

                        //             //  const pin = document.getElementById("pin");

                        //             //  self.setContentAppend('<br><button type="button" id="submitPinBtn">Submit</button>');

                        //             //  self.setButtons({}); // Remove OK and Close buttons

                        //             //  -//---SECOND REQUEST
                        //             //     $.ajax({
                        //             //     url: '/ResetPassStepTwo',
                        //             //     method: 'post',
                        //             //     data: {
                        //             //         pin: pin.value
                        //             //     }
                        //             //     }).done(async function (response) {
                        //             //         self.setTitle(response.name);
                        //             //         self.setContentAppend('<br>' + response + '<br><br>success');
    
                        //             //     }).fail(function (jqXHR, error) {
                        //             //         self.setContentAppend('<br>' + jqXHR.responseText);
                        //             //     });

                        //         }).fail(function (jqXHR, error) {
                        //             self.setContentAppend('<br>' + jqXHR.responseText);
                        //         });
                        //     }
                        // });

                    }
                }
            },
            cancel: function () {
                //close
            },
        },
        onContentReady: function () {
            // bind to events
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                // if the user submits the form by pressing enter in the field.
                e.preventDefault();
                jc.$$formSubmit.trigger('click'); // reference the button and click it
            });
        }
    }); 
});

function VerificationStepTwo(email){
    $.confirm({
        type: 'blue',
        theme: 'material',
        boxWidth: '30%',
        useBootstrap: false,
        title: 'Enter 4 Digit Pin',
        content: 
        `
             <form action="" class="formName">
             <div class="form-group">
             <br>
             <label>Enter Pin</label>
             <input type="text" placeholder="Your pin" class="pin form-control" required />
             </div>
             </form>
        `,
        buttons: {
            formSubmit: {
                text: 'Submit',
                btnClass: 'btn-blue',
                action: function () {
                    var pin = this.$content.find('.pin').val();
                    if (!pin) {
                        $.alert({
                            title: 'Error!',
                            type: 'red',
                            content: 'Please fill up the necessary form',
                            boxWidth: '20%',
                            useBootstrap: false,
                        });
                        return false;
                    } else {

                        $.ajax({
                        url: '/ResetPassStepTwo',
                        method: 'post',
                        data: {
                        pin: pin,
                        email: email
                        }
                        }).done(function (response) {

                            alert(response.username + " " + response.staffID);
                            //setupNewPassword(response.username, response.staffID);

                            //  self.setTitle(response.name);
                            //  self.setContentAppend('<br>' + response + '<br><br><input type="password" id="pin" placeholder="Enter PIN">');
    
                                        //  const pin = document.getElementById("pin");
    
                                        //  self.setContentAppend('<br><button type="button" id="submitPinBtn">Submit</button>');
    
                                        //  self.setButtons({}); // Remove OK and Close buttons
    
                                        //  -//---SECOND REQUEST
                                        //     $.ajax({
                                        //     url: '/ResetPassStepTwo',
                                        //     method: 'post',
                                        //     data: {
                                        //         pin: pin.value
                                        //     }
                                        //     }).done(async function (response) {
                                        //         self.setTitle(response.name);
                                        //         self.setContentAppend('<br>' + response + '<br><br>success');
        
                                        //     }).fail(function (jqXHR, error) {
                                        //         self.setContentAppend('<br>' + jqXHR.responseText);
                                        //     });
    
                            }).fail(function (jqXHR, error) {
                                //notify
                                alert(jqXHR.responseText);
                            });

                        // $.confirm({
                        //     title: 'Smartqueue Responded',
                        //     type: 'blue',
                        //     theme: 'material',
                        //     boxWidth: '30%',
                        //     useBootstrap: false,
                        //     content: function () {
                        //         var self = this;
                        //         return $.ajax({
                        //             url: '/ResetPassStepOne',
                        //             method: 'post',
                        //             data: {
                        //                 email: email
                        //             }
                        //         }).done(function (response) {
                        //             //  self.setTitle(response.name);
                        //             //  self.setContentAppend('<br>' + response + '<br><br><input type="password" id="pin" placeholder="Enter PIN">');

                        //             //  const pin = document.getElementById("pin");

                        //             //  self.setContentAppend('<br><button type="button" id="submitPinBtn">Submit</button>');

                        //             //  self.setButtons({}); // Remove OK and Close buttons

                        //             //  -//---SECOND REQUEST
                        //             //     $.ajax({
                        //             //     url: '/ResetPassStepTwo',
                        //             //     method: 'post',
                        //             //     data: {
                        //             //         pin: pin.value
                        //             //     }
                        //             //     }).done(async function (response) {
                        //             //         self.setTitle(response.name);
                        //             //         self.setContentAppend('<br>' + response + '<br><br>success');
    
                        //             //     }).fail(function (jqXHR, error) {
                        //             //         self.setContentAppend('<br>' + jqXHR.responseText);
                        //             //     });

                        //         }).fail(function (jqXHR, error) {
                        //             self.setContentAppend('<br>' + jqXHR.responseText);
                        //         });
                        //     }
                        // });

                    }
                }
            },
            cancel: function () {
                //close
            },
        },
        onContentReady: function () {
            // bind to events
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                // if the user submits the form by pressing enter in the field.
                e.preventDefault();
                jc.$$formSubmit.trigger('click'); // reference the button and click it
            });
        }
    }); 
}
userCredentials = [];
function setupNewPassword(username, staffId){
    $.confirm({
        type: 'blue',
        theme: 'material',
        boxWidth: '30%',
        useBootstrap: false,
        title: 'Enter 4 Digit Pin',
        content: 
        `
             <form action="" class="formName">
             <div class="form-group">
             <br>
             <label>Enter Pin</label>
             <input type="text" placeholder="Your pin" class="pin form-control" required />
             </div>
             </form>
        `,
        buttons: {
            formSubmit: {
                text: 'Submit',
                btnClass: 'btn-blue',
                action: function () {
                    var pin = this.$content.find('.pin').val();
                    if (!pin) {
                        $.alert({
                            title: 'Error!',
                            type: 'red',
                            content: 'Please fill up the necessary form',
                            boxWidth: '20%',
                            useBootstrap: false,
                        });
                        return false;
                    } else {

                        $.ajax({
                        url: '/ResetPassStepTwo',
                        method: 'post',
                        data: {
                        pin: pin,
                        email: email
                        }
                        }).done(function (response) {

                            alert("password reset complete");

                            //  self.setTitle(response.name);
                            //  self.setContentAppend('<br>' + response + '<br><br><input type="password" id="pin" placeholder="Enter PIN">');
    
                                        //  const pin = document.getElementById("pin");
    
                                        //  self.setContentAppend('<br><button type="button" id="submitPinBtn">Submit</button>');
    
                                        //  self.setButtons({}); // Remove OK and Close buttons
    
                                        //  -//---SECOND REQUEST
                                        //     $.ajax({
                                        //     url: '/ResetPassStepTwo',
                                        //     method: 'post',
                                        //     data: {
                                        //         pin: pin.value
                                        //     }
                                        //     }).done(async function (response) {
                                        //         self.setTitle(response.name);
                                        //         self.setContentAppend('<br>' + response + '<br><br>success');
        
                                        //     }).fail(function (jqXHR, error) {
                                        //         self.setContentAppend('<br>' + jqXHR.responseText);
                                        //     });
    
                            }).fail(function (jqXHR, error) {
                                //notify
                                alert(jqXHR.responseText);
                            });
                    }
                }
            },
            cancel: function () {
                //close
            },
        },
        onContentReady: function () {
            // bind to events
            var jc = this;
            this.$content.find('form').on('submit', function (e) {
                // if the user submits the form by pressing enter in the field.
                e.preventDefault();
                jc.$$formSubmit.trigger('click'); // reference the button and click it
            });
        }
    }); 

}