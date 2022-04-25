<?php
    class errors_dao {
        static $_instance;

        private function __construct() {
        }

        public static function getInstance() {
            if(!(self::$_instance instanceof self)){
                self::$_instance = new self();
            }
            return self::$_instance;
        }

        public function errors_log($db) {

            $sql = "SELECT * FROM errors ORDER BY date ASC";

            $stmt = $db -> ejecutar($sql);
            return $db -> listar($stmt);
        }

        public function insert_log($db, $desc) {

            $sql = "INSERT INTO errors (type, date) VALUES ('$desc', CURRENT_DATE)";

            $stmt = $db -> ejecutar($sql);
            return $db -> listar($stmt);
        }

        public function delete_errors_log($db) {

            $sql = "DELETE FROM errors";

            $stmt = $db -> ejecutar($sql);
            return $db -> listar($stmt);
        }

    }
?>