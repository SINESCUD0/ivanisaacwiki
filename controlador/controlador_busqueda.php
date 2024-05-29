<?php
require_once $_SERVER['DOCUMENT_ROOT']."/modelo/modelo_isaacle.php";

if(isset($_POST['busqueda'])){
	$busqueda = $_POST['busqueda'];
	$arrayObjetos = buscarObjeto($busqueda);
	echo json_encode($arrayObjetos);
}elseif (isset($_POST['id'])) {
	$objeto = $_POST['id'];
	$informacion = obtenerDatos($objeto);
	$descripcion = obtenerDescripcion($objeto);
	$array = array($informacion,$descripcion);
	echo json_encode($array);
}
?>