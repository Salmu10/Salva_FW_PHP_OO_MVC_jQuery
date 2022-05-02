// ------------------- LOGIN ------------------------ //

function click_login(){

    $("#login_form").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code == 13){
            e.preventDefault();
            login();
        }
    });
    
    $('#button_login').on('click', function(e) {
        e.preventDefault();
        login();
    }); 

    $('#forget_pass').on('click', function(e) {
        e.preventDefault();
        load_form_recover_password();
    }); 

    $('#google').on('click', function(e) {
        social_login('google');
        // console.log('google');
    }); 

    $('#github').on('click', function(e) {
        // console.log('github');
        social_login('github');
    }); 
}

function validate_login(){
    var error = false;

	if(document.getElementById('username').value.length === 0){
		document.getElementById('error_username').innerHTML = "Tienes que escribir el usuario";
		error = true;
	}else{
        document.getElementById('error_username').innerHTML = "";
    }
	
	if(document.getElementById('pass').value.length === 0){
		document.getElementById('error_password').innerHTML = "Tienes que escribir la contraseña";
		error = true;
	}else{
        document.getElementById('error_password').innerHTML = "";
    }
	
    if(error == true){
        return 0;
    }
}

function login(){

    if(validate_login() != 0){
        var data = $('#login_form').serialize();
        $.ajax({
            url: friendlyURL("?module=login&op=login"),
            dataType: "JSON",
            type: "POST",
            data: data,
        }).done(function(result) {
            console.log(result);
            // if(result == "error"){		
            //     $("#error_password").html('Wrong password');
            // }else{
            //     localStorage.setItem("token", result);
            //     toastr.options.timeOut = 3000;
            //     toastr.success("Inicio de sesión realizado");
            //     if(localStorage.getItem('likes') == null) {
            //         setTimeout("window.location.href = " + friendlyURL("?module=home&op=view"), 1000);
            //     } else {
            //         console.log(localStorage.getItem('product'));
            //         setTimeout("window.location.href = " + friendlyURL("?module=shop&op=view"), 1000);
            //     }
            // }	
        }).fail(function() {
            console.log('Error: Login error');
            // window.location.href = 'index.php?module=errors&op=503&desc=Login error';
        });     
    }
}

///////////////////
function social_login(param){
    authService = firebase_config();
    authService.signInWithPopup(provider_config(param))
    .then(function(result) {
        console.log('Hemos autenticado al usuario ', result.user);
        console.log(result.user.displayName);
        console.log(result.user.email);
        console.log(result.user.photoURL);

        /////////// INSERT USER EN LA BD?? ////////////

        // if (result) 
        //     ajaxPromise(friendlyURL("?module=login&op=social_login"), 'POST', 'JSON', result)
        //     .then(function(data) {
        //         console.log(data);
        //         // click_recover_password();
        //     })
        //     .catch(function() {
        //         console.log('Error: Social login error');
        //         // window.location.href = 'index.php?module=errors&op=503&desc=Types error';
        //     });
    })
    .catch(function(error) {
        console.log('Error: Social login error');
    });
}

function firebase_config(){
    var config = {
        apiKey: "AIzaSyAEXsbw5Ttf2RJ4cbaAVVJgD40gWu_7p3s",
        authDomain: "fair-kingdom-346513.firebaseapp.com",
        projectId: "fair-kingdom-346513",
        storageBucket: "fair-kingdom-346513.appspot.com",
        messagingSenderId: "193372223087",
        appId: "1:193372223087:web:bb9e65759d8060089ebf9a",
        measurementId: "G-Y6GBJQGKHJ"
    };
    if(!firebase.apps.length){
        firebase.initializeApp(config);
    }else{
        firebase.app();
    }
    return authService = firebase.auth();
}

function provider_config(param){
    if(param === 'google'){
        var provider = new firebase.auth.GoogleAuthProvider();
        provider.addScope('email');
        return provider;
    }else if(param === 'github'){
        return provider = new firebase.auth.GithubAuthProvider();
    }
}

// ------------------- REGISTER ------------------------ //

function click_register(){

	$("#register_form").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code == 13){
        	e.preventDefault();
            register();
        }
    });

	$('#button_register').on('click', function(e) {
        e.preventDefault();
        register();
    }); 
}

function validate_register(){
    var mail_exp = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    var error = false;

	if(document.getElementById('username_reg').value.length === 0){
		document.getElementById('error_username_reg').innerHTML = "You have to write an username";
		error = true;
	}else{
        if(document.getElementById('username_reg').value.length > 15 || document.getElementById('username_reg').value.length < 5){
            console.log("hola");
            document.getElementById('error_username_reg').innerHTML = "The username must be between 5 and 15 characters";
            error = true;
        }else{
            document.getElementById('error_username_reg').innerHTML = "";
        }
    }

    if(document.getElementById('pass_reg').value.length === 0){
		document.getElementById('error_password_reg').innerHTML = "You have to write a password";
		error = true;
	}else{
        if(document.getElementById('pass_reg').value.length < 8){
            document.getElementById('error_password_reg').innerHTML = "The password must be longer than 8 characters";
            error = true;
        }else{
            document.getElementById('error_password_reg').innerHTML = "";
        }
    }

    if(document.getElementById('pass_reg_2').value != document.getElementById('pass_reg').value){
		document.getElementById('error_password_reg_2').innerHTML = "Passwords don't match";
		error = true;
	}else{
        document.getElementById('error_password_reg_2').innerHTML = "";
    }

    if(document.getElementById('email_reg').value.length === 0){
		document.getElementById('error_email_reg').innerHTML = "You have to write an email";
		error = true;
	}else{
        if(!mail_exp.test(document.getElementById('email_reg').value)){
            document.getElementById('error_email_reg').innerHTML = "The email format is invalid"; 
            error = true;
        }else{
            document.getElementById('error_email_reg').innerHTML = "";
        }
    }
	
    if(error == true){
        return 0;
    }
}

function register(){

    if(validate_register() != 0){
        var data = $('#register_form').serialize();
        $.ajax({
            url: friendlyURL("?module=login&op=register"),
            type: "POST",
            dataType: "JSON",
            data: data,
        }).done(function(result) {  
            console.log(result);
            if(result == "error"){		
                $("#error_email_reg").html('The email is already in use');
                $("#error_username_reg").html('The username is already in use');
            }else{
                toastr.options.timeOut = 2000;
                toastr.success("Email sended");
                // window.location.href = friendlyURL("?page=login&op=view");
                // setTimeout(100000, window.location.href = friendlyURL("?module=login&op=view"));
            }	
        }).fail(function() {
            console.log('Error: Register error');
            // window.location.href = 'index.php?module=errors&op=503&desc=Register error';
        }); 
    }
}

// ------------------- RECOVER PASSWORD ------------------------ //

function load_form_recover_password(){
    // console.log('Hola');
    ajaxPromise(friendlyURL("?module=login&op=recover_view"), 'POST', 'JSON')
    .then(function( data ) {
        console.log(data);
        click_recover_password();
    })
    .catch(function() {
      console.log('Error: Recover view error');
      // window.location.href = 'index.php?module=errors&op=503&desc=Types error';
    });
}

function click_recover_password(){
    $("#forget_form").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
        	e.preventDefault();
            send_recover_password();
        }
    });

    $('#button_recover').on('click', function(e) {
        e.preventDefault();
        send_recover_password();
    }); 
}

function validate_recover_password(){
    var mail_exp = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    var error = false;

    if(document.getElementById('email').value.length === 0){
		document.getElementById('error_email').innerHTML = "Tienes que escribir un correo";
		error = true;
	}else{
        if(!mail_exp.test(document.getElementById('email').value)){
            document.getElementById('error_email').innerHTML = "El formato del mail es invalido"; 
            error = true;
        }else{
            document.getElementById('error_email').innerHTML = "";
        }
    }
	
    if(error == true){
        return 0;
    }
}

function send_recover_password(){
    if(validate_recover_password() != 0){
        var data = { email : $('#email').val()};
        $.ajax({
            url: friendlyURL('?module=login&op=send_recover_email'),
            dataType: 'json',
            type: "POST",
            data: data,
        }).done(function(data) {
            toastr.options.timeOut = 3000;
            toastr.success("Email sended");
        }).fail(function( textStatus ) {
            console.log('Error: Recover password error');
        });    
    }
}

function load_form_new_password(token){
    $.ajax({
        url: friendlyURL('?page=login&op=verify_token'),
        dataType: 'json',
        type: "POST",
        data: {token: token},
    }).done(function(data) {
        if(data == "verify"){
            console.log(data);
            $('<form></form>').attr({'id': 'new_password__form', 'method': 'post'}).html('<h2>New password</h2>').appendTo('.container');
            $('<div></div>').attr({'class': 'form__content'}).appendTo('#new_password__form');
            $('<div></div>').attr({'class': 'form__input'}).html('<label for="password"><b>Password</b></label>'+
            '<input type="text" placeholder="Enter password" id="password" name="password" required>'+
            '<font color="red"><span id="error_password" class="error"></span></font>').appendTo('.form__content');
            $('<div></div>').attr({'class': 'form__input'}).html('<label for="password1"><b>Password</b></label>'+
            '<input type="text" placeholder="Enter password" id="password1" name="password1" required>'+
            '<font color="red"><span id="error_password1" class="error"></span></font>').appendTo('.form__content');
            $('<div></div>').attr({'class': 'button_container'}).html('<input class="button" id="recover" type="button" value = "Enter"/>').appendTo('.form__content');
            click_new_password(token); 
        }else{
            console.log("error");
        }
    }).fail(function( textStatus ) {
        if ( console && console.log ) {
            console.log( "La solicitud ha fallado: " +  textStatus);
        }
    });    
}

function click_new_password(token){
    $("#new_password__form").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
        	e.preventDefault();
            send_new_password(token);
        }
    });

    $('#recover').on('click', function(e) {
        e.preventDefault();
        send_new_password(token);
    }); 
}

function validate_new_password(){
    if(document.getElementById('password').value.length === 0){
        document.getElementById('error_password1').innerHTML = "";
		document.getElementById('error_password').innerHTML = "Tienes que escribir la contraseña";
		error = true;
	}else{
        if(document.getElementById('password').value.length < 8){
            document.getElementById('error_password1').innerHTML = "";
            document.getElementById('error_password').innerHTML = "La password tiene que tener 8 caracteres como minimo";
            error = true;
        }else{
            if(document.getElementById('password').value !== document.getElementById('password1').value){
                document.getElementById('error_password').innerHTML = "";
                document.getElementById('error_password1').innerHTML = "Las contraseñas no son iguales";
                error = true;
            }else{
                document.getElementById('error_password').innerHTML = "";
            }
        }
    }
}

function send_new_password(token){
    if(validate_new_password() != 0){
        var data = {token: token, password : $('#password').val()};
        console.log(data);
        $.ajax({
            url: friendlyURL("?page=login&op=new_password"),
            type: "POST",
            dataType: "JSON",
            data: data,
        }).done(function(data) {
            toastr.success('New password');
        }).fail(function( textStatus ) {
            if ( console && console.log ) {
                console.log( "La solicitud ha fallado: " +  textStatus);
            }
        });    
    }
}

// ------------------- LOAD CONTENT ------------------------ //

function load_content() {
    let path = window.location.pathname.split('/');
    console.log(path);
    if(path[4] === 'recover'){
        load_form_new_password(path[5]);
    }else if (path[4] === 'verify') {
        /*
        function verify_email(path[5]){
            $.ajax({url: friendlyURL('?page=login&op=verify_email')
        */
    }else if (path[3] === 'register') {
        click_register();
    }else if(path[3] === 'login'){
        click_login();
    }
}

$(document).ready(function(){
    load_content();
    click_login();
    click_register();
});