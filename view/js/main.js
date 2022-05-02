/* AJAX PROMISE */

function ajaxPromise(sUrl, sType, sTData, sData = undefined) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: sUrl,
            type: sType,
            dataType: sTData,
            data: sData
        }).done((data) => {
            resolve(data);
        }).fail((jqXHR, textStatus, errorThrow) => {
            reject(errorThrow);
        }); 
    });
}

/* FRIENDLY URL */

function friendlyURL(url) {
    var link = "";
    url = url.replace("?", "");
    url = url.split("&");
    cont = 0;
    for (var i = 0; i < url.length; i++) {
    	cont++;
        var aux = url[i].split("=");
        if (cont == 2) {
        	link += "/" + aux[1] + "/";	
        }else{
        	link += "/" + aux[1];
        }
    }
    return "http://localhost/Ejercicios/Framework_PHP_OO_MVC" + link;
}

/* LOAD MENU */

function load_menu() {
    $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="' + friendlyURL("?module=home&op=view") + '" class="nav_link">Home</a>').appendTo('.nav_list');
    $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="' + friendlyURL("?module=shop&op=view") + '" class="nav_link">Shop</a>').appendTo('.nav_list');
    $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="' + friendlyURL("?module=contact&op=view") + '" class="nav_link">Contact us</a>').appendTo('.nav_list');
    // $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="' + friendlyURL("?module=errors&op=errors_log") + '" class="nav_link" data-tr="Errors log">Errors log</a>').appendTo('.nav_list');
    ajaxPromise(friendlyURL('?module=login&op=data_user'), 'POST', 'JSON', {token: localStorage.getItem('token')})
    .then(function(data) {
        if (data.user_type === 'admin') {
            menu_admin();
        }else if (data.user_type === 'client') {
            menu_client();
        }
        click_profile(data);
    }).catch(function() {
        $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="' + friendlyURL("?module=login&op=view") + '" class="nav_link" data-tr="Log in">Log in</a>').appendTo('.nav_list');
        // $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="index.php?module=errors&op=errors_log" class="nav_link" data-tr="Errors log">Errors log</a>').appendTo('.nav_list');
    });
}

/* MENUS */

function menu_admin() {
    // $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="index.php?page=controller_crud&op=list" class="nav_link">Crud</a>').appendTo('.nav_list');
    $('<li></li>').attr({'class' : 'nav_item'}).html('<a href="" id="logout" class="nav_link">Log out</a>').appendTo('.nav_list');
}

function menu_client() {
    $('<li></li>').attr('class', 'profile').attr('id', 'profile').html('<a id="profile" class="nav_link" data-tr="Profile">Profile</a>').appendTo('.nav_list');
    // $('<li></li>').attr('class', 'nav_item').html('<a href="index.php?module=errors&op=errors_log" class="nav_link" data-tr="Errors log">Errors log</a>').appendTo('.nav_list');
}

/* CLICK PROFILE */

function click_profile(data) {
    $(document).on('click', '#profile', function() {
        $(".profile_options").remove();
        $('<div></div>').attr('class', 'profile_options').attr('id', 'profile_options').appendTo('.nav_list_profile')
        .html(
            "<ul class='profile_list' id='profile_list'>" +
                "<li><div class='user'>" +
                "<div class='user_img'><img class='avatar_img' src='" + data.avatar + "'></div>" + 
                "<div class='user_name'>" + data.username + "</div></li>" +
                "<li><div id='logout' class='logout' data-tr='Log out'>Log out</div></li>" +
            "</ul>"
        )
    });
    $(document).on('click scroll', function(event) {
        if (event.target.id !== 'profile') {
            $('.profile_options').fadeOut(500);
        }
    });
}


/* CLICK LOGOUT */

function click_logout() {
    $(document).on('click', '#logout', function() {
        logout();
        setTimeout(1000, window.location.href = friendlyURL("?module=home&op=view"));
    });
}

/* LOGOUT */

function logout() {
    $.ajax({
        url: friendlyURL("?module=login&op=logout"),
        type: 'POST',
        dataType: 'JSON'
    }).done(function(data) {
        localStorage.removeItem('token');
        window.location.href = friendlyURL("?module=home&op=view");
        console.log("Sesion cerrada");
    }).fail(function() {
        console.log("Error: Logout error");
        // window.location.href = 'index.php?module=errors&op=503&desc=Logout error';
    });
}

// ------------------- LOAD CONTENT ------------------------ //

function load_content() {
    let path = window.location.pathname.split('/');
    console.log(path[5]);
    if(path[5] === 'recover'){
        console.log('hola recover');
        // load_form_new_password(path[6]);
    }else if (path[5] === 'verify') {
        // console.log(path[6]);
        ajaxPromise(friendlyURL("?module=login&op=verify_email"), 'POST', 'JSON', {token_email: path[6]})
        .then(function(data) {
            console.log(data);
            window.location.href = friendlyURL("?module=home&op=view");
        })
        .catch(function() {
          console.log('Error: verify email error');
        });

        /*
        function verify_email(path[6]){
            // $.ajax({url: friendlyURL('?page=login&op=verify_email')
        */
    }
}

$(document).ready(function() {
    load_menu();
    click_logout();
    load_content();
});