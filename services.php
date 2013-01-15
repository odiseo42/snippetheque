<?php
/**
 * Step 1: Require the Slim Framework
 *
 * If you are not using Composer, you need to require the
 * Slim Framework and register its PSR-0 autoloader.
 *
 * If you are using Composer, you can skip this step.
 */
require 'Slim/Slim.php';
require "NotORM.php";

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

try {
    $dsn = 'mysql:host=localhost;dbname=snippet';
    $username = 'root';
    $password = '';
    $pdo = new PDO($dsn, $username, $password);    
    $db = new NotORM($pdo);
}
catch(PDOException $e){
    $app->error();
}


$app->get("/snippets/(:query)", function ($query="") use ($app, $db) {
    $snippets = $db->snippets();
    $snippets->order("timestamp DESC");
    $snippets->limit(5);
    if($query){
        $snippets->where("content LIKE ?", "%$query%");
    }
    $res = array();
    foreach ($snippets as $snipp) {
        
        $res[$snipp["id"]]  = array(
            "id" => $snipp["id"],
            "content" => $snipp["content"],
        );
    }
    $app->response()->header("Content-Type", "application/json");
    echo json_encode($res);
});


$app->get("/snippetById/:id", function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $snippet = $db->snippets()->where("id", $id);
    if ($data = $snippet->fetch()) {
        echo json_encode(array(
            "id" => $data["id"],
            "content" => $data["content"]
            ));
    }
    else{
        echo json_encode(array(
            "status" => false,
            "message" => "snippet ID $id does not exist"
            ));
    }
});

$app->post("/snippet", function () use($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $snippet = $app->request()->post();
    $content = $req->post('content');
    $userid = $req->post('userid');
    $result = $db->snippets->insert(array('content'=>$content, 'userid' =>$userid));
    echo json_encode(array("id" => $result["id"]));
});

$app->error(function (\Exception $e) use ($app) {
    $app->render('serviceError.php');
});

// run the Slim app
$app->run();