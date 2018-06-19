/**
 * Date: 19.06.2018
 * Time: 13:15


<?php

//Создаем функцию-шаблонизатор

function renderTemplate($templatePath, $templateData = []) {
    $content = '';
    extract($templateData);

    if (file_exists($templatePath)) {
        ob_start();
        require($templatePath);
        $content = ob_get_contents();
        ob_end_clean();
    }

    return $content;
}

 ?>