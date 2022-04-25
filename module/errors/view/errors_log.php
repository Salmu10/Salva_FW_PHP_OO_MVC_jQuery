<div id="contenido">
    <div class="container">
    	<div class="row">
    			<h1 class=titulo>Errors log</h1>
    	</div>
        <br>
        <br>
        <br>
        <br>
        <br>
    	<div class="row">
    		<table>
                <tr>
                    <td width=800 align="center"><h3>Error type</h3></td>
                    <td width=700 align="center"><h3>Date of the error</h3></td>
                </tr>
                <?php
                    if ($res->num_rows === 0){
                        echo '<tr>';
                        echo '<td align="center" colspan="3">The errors log is void</td>';
                        echo '</tr>';
                    }else{
                        foreach ($res as $row) {
                       		echo '<tr>';
                            echo '<td width=650 align="center">'. $row['type'] . '</td>';
                    	   	echo '<td width=750 align="center">'. $row['date'] . '</td>';
                        }
                    }
                ?>
            </table>
            <br>
            <br>
            <br>
            <br>
            </div>
            <table>
                <tr>
                    <th width=2000><h2>Delete errors log</h2></th>
                </tr>
                <tr>
                    <th><p><a href="index.php?module=errors&op=delete_errors_log"><img src='http://localhost/Ejercicios/Framework_PHP_OO_MVC/view/images/Papelera.png'></a></p></th>
                </tr>
            </table>    	
    </div>
</div>