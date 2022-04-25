<?php
	class errors_bll {
		private $dao;
		private $db;
		static $_instance;

		function __construct() {
			$this -> dao = errors_dao::getInstance();
			$this -> db = db::getInstance();
		}

		public static function getInstance() {
			if (!(self::$_instance instanceof self)) {
				self::$_instance = new self();
			}
			return self::$_instance;
		}

		public function get_errors_log_BLL() {
			return $this -> dao -> errors_log($this -> db);
		}

		public function get_error_503_BLL($args) {
			return $this -> dao -> insert_log($this -> db, $args[0]);
		}

		public function get_delete_errors_log_BLL() {
			return $this -> dao -> delete_errors_log($this -> db);
		}
	}
?>