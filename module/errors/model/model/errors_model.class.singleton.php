<?php
    class errors_model {

        private $bll;
        static $_instance;
        
        function __construct() {
            $this -> bll = errors_bll::getInstance();
        }

        public static function getInstance() {
            if (!(self::$_instance instanceof self)) {
                self::$_instance = new self();
            }
            return self::$_instance;
        }

        public function get_errors_log() {
            return $this -> bll -> get_errors_log_BLL();
        }

        public function get_error_503($args) {
            return $this -> bll -> get_error_503_BLL($args);
        }

        public function get_delete_errors_log() {
            return $this -> bll -> get_delete_errors_log_BLL();
        }
    }
?>