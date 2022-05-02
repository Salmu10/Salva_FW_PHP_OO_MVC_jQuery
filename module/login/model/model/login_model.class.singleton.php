<?php
class login_model {
    private $bll;
    static $_instance;
    
    function __construct() {
        $this -> bll = login_bll::getInstance();
    }

    public static function getInstance() {
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    public function get_register($args) {
        $res = $this -> bll -> get_register_BLL($args);

        if($res == "error"){
            return 'error';
        }else{
            $message = [ 'type' => 'validate', 
                            'token' => $res, 
                            'toEmail' => $_POST['email_reg']];
            $email = json_decode(mail::send_email($message), true);
            if (!empty($email)) {
                // echo json_encode($email);
                // echo json_encode($result);
                return json_encode($email);  
            }   
        }
    }

    public function get_login($args) {
        return $this -> bll -> get_login_BLL($args);
    }

    public function get_social_login($args) {
        return $this -> bll -> get_social_login_BLL($args);
    }



    
    public function get_verify_email($args) {
        return $this -> bll -> get_verify_email_BLL($args);
    }

    public function get_recover_email($args) {
        return $this -> bll -> get_recover_email_BBL($args);
    }

    // public function get_recover_password($args) {
    //     return $this -> bll -> get_recover_password_BLL($args);
    // }

    public function get_verify_token($args) {
        return $this -> bll -> get_verify_token_BLL($args);
    }

    public function get_new_password($args) {
        return $this -> bll -> get_new_password_BLL($args);
    }

    public function get_data_user($args) {
        return $this -> bll -> get_data_user_BLL($args);
    }
}