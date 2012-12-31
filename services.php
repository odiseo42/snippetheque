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

$dsn = 'mysql:host=localhost;dbname=snippet';
$username = 'root';
$password = 'root';
$pdo = new PDO($dsn, $username, $password);
$db = new NotORM($pdo);


\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();
// add new Route 
$app->get("/snippets", function () use ($app, $db) {
    $snippets = array();
    foreach ($db->snippets() as $snipp) {
        $snippets[]  = array(
            "id" => $snipp["id"],
            "content" => $snipp["content"],
        );
    }
    $app->response()->header("Content-Type", "application/json");
    echo json_encode($snippets);
});

$app->get("/snippet/:id", function ($id) use ($app, $db) {
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

$app->get("/query/:query", function ($query) use ($app, $db) {
	$snippets = $db->snippets()
	    ->where("content LIKE ?", "%$query%")
	    ->limit(10)
	;
    $res = array();
    foreach ($snippets as $snipp) {
        $res[]  = array(
            "id" => $snipp["id"],
            "content" => $snipp["content"],
        );
    }
    $app->response()->header("Content-Type", "application/json");
    echo json_encode($res);
});

$app->post("/snippet", function () use($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $snippet = $app->request()->post();
    $content = $req->post('content');
    $userid = $req->post('userid');
    $result = $db->snippets->insert(array('content'=>$content, 'userid' =>$userid));
    echo json_encode(array("id" => $result["id"]));
});

// run the Slim app
$app->run();