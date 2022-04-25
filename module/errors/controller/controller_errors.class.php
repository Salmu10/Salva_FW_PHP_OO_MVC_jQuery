<?php
    class controller_errors {

        function errors_log() {
            $res = (common::load_model('errors_model', 'get_errors_log'));
            if ($res) {
                common::load_view('top_page.html', VIEW_PATH_ERRORS . 'errors_log.php');
            }
        }

        function error_503() {
            common::load_model('home_model', 'get_error_503', $_GET['desc']);
            common::load_view('top_page.html', VIEW_PATH_ERRORS . '503.html');
        }

        function error_404() {
            common::load_view('top_page.html', VIEW_PATH_ERRORS . '404.html');
        }
        
        function delete_errors_log() {
            common::load_view('top_page.html', VIEW_PATH_ERRORS . 'delete_errors_log.html');
            $res = (common::load_model('errors_model', 'get_delete_errors_log'));
            if ($res) {
                common::load_view('top_page.html', VIEW_PATH_ERRORS . 'errors_log.php');
            }
        }
    }
?>