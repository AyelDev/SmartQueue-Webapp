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

                            setupNewPassword(response.username, response.staffID)

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

function setupNewPassword(username, staffId){
    $.confirm({
        type: 'blue',
        theme: 'material',
        boxWidth: '30%',
        useBootstrap: false,
        title: 'Your Password Can Now Be Reset',
        content: 
        `
             <form action="" class="formName">
             <div class="form-group">
             <br>
             <label>Username : `+username+`</label>
             <br>
             <label>Enter Password</label>
             <input type="text" placeholder="Your password" class="pass form-control" required />
             <br>
             <label>Enter Confirm Password</label>
             <input type="text" placeholder="Your confirm password" class="conpass form-control" required />
             </div>
             </form>
        `,
        buttons: {
            formSubmit: {
                text: 'Submit',
                btnClass: 'btn-blue',
                action: function () {
                    var pass = this.$content.find('.pass').val();
                    var conpass = this.$content.find('.conpass').val();
                    if (!pass || !conpass) {
                        $.alert({
                            title: 'Error!',
                            type: 'red',
                            content: 'Please fill up the necessary form',
                            boxWidth: '20%',
                            useBootstrap: false,
                        });
                        return false;
                    } 
                    
                    if(pass !== conpass){
                        $.alert({
                            title: 'Error!',
                            type: 'red',
                            content: 'Confirm password does not match',
                            boxWidth: '20%',
                            useBootstrap: false,
                        });
                        return false;
                    }

                        $.ajax({
                        url: '/CompleteResetPass',
                        method: 'POST',
                        data: {
                        password: pass,
                        id: staffId
                        }
                        }).done(function (response) {

                            alert("password reset complete");
    
                            }).fail(function (jqXHR, error) {
                                //notify
                                alert(jqXHR.responseText);
                            });
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