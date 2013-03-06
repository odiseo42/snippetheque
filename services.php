<?php
/**
 * Using  Slim Framework - a microframework for web services
 */
require 'Slim/Slim.php';
require "NotORM.php";

\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();
$app->error(function (\Exception $e) use ($app) {
    echo $e->getMessage();
    $app->stop();
});


try {
    $dsn = 'mysql:host=localhost;dbname=snippet';
    $username = 'root';
    $password = 'root';
    $pdo = new PDO($dsn, $username, $password);    
    $db = new NotORM($pdo);
}
catch(PDOException $e){
    $app->error($e);
 
}
//$app->get("/userid/:userid(/query(/:query(/lastid(/:id))))"
$app->get("/userid/:userid/query(/:query)/lastid(/:lastid)", function ($userid="", $query="", $lastid="") use ($app, $db) {
    $snippets = $db->snippets();
    $snippets->order("id DESC");
    $snippets->limit(5);

    
    if(is_numeric($userid)){
        $snippets->where("user_id = ?", "$userid");        
    }   
    else{
        $app->error();
    } 

    if($query!=""){
        $snippets->where("content LIKE ?", "%$query%");
    }


    if(is_numeric($lastid)){
        $snippets->where("id < ?", $lastid);        
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

$app->post("/userid/:userid(/query/lastid)", function ($userid) use($app, $db) {
    $req = $app->request();
    $data = json_decode($req->getBody(), true);

    $conteny = "";
    if(!empty($data)){
        $content = $data['content'];
    }

    $result = $db->snippets->insert(array('content'=>$content, 'user_id' =>$userid));

    $app->response()->header("Content-Type", "application/json");
    if($result){
        $res = array();
        $res[$result['id']]  = array(
            "id" => $result['id'],
            "content" => $content
        );        
        echo json_encode($res);
    }
    else{
        $app->error();
    }
});



$app->get("/snippetById/:id", function ($id) use ($app, $db) {
    $app->response()->header("Content-Type", "application/json");
    $snippet = $db->snippets()->where("id", $id);
    if ($data = $snippet->fetch()) {
        echo json_encode(array(
            "id" => $data["id"],
            ));
    }
    else{
        echo json_encode(array(
            "status" => false,
            "message" => "snippet ID $id does not exist"
            ));
    }
});



// run the Slim app
$app->run();
