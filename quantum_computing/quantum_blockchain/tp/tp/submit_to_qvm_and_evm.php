<?php


    header("Access-Control-Allow-Origin: *");
    putenv("PYQUIL_CONFIG=/home/jovyan/.pyquil_config");

    $res = shell_exec("python /home/jovyan/tp/python_scripts/superdense.py " . $_POST['alice_message']  . " 2>&1");
    $res = shell_exec("python /home/jovyan/tp/python_scripts/superdense.py " . $_POST['bob_message']  . " 2>&1");

    echo $res;

?>
