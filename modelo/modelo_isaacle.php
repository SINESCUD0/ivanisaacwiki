<?php
require_once $_SERVER['DOCUMENT_ROOT']."/db/db.php";
function buscarObjeto($cajaTexto){
	global $conexion;
	$cajaTexto .= "%";
	$objetoImagen = "";
	$objetosArray = array();
	try {
		$obtenerInfo = $conexion->prepare("SELECT name, type FROM objects WHERE name LIKE :cajaTexto;");
		$obtenerInfo->bindParam(':cajaTexto', $cajaTexto);
		$obtenerInfo->execute();
		$informacion=$obtenerInfo->fetchAll();
		foreach ($informacion as $objeto) {
			$type = "";
			if($objeto[1]){
				$type = "Active Items";
			}else{
				$type = "Passive Items";
			}
			if(str_starts_with($objeto[0],"<") && str_ends_with($objeto[0], "3")){
				$objetoImagen = str_replace("<3", "Less Than Three", $objeto[0]);
			}else{
				$objetoImagen = $objeto[0];
			}
			$imagen = "/photos/The Binding of Isaac HD Items/".$type."/".$objetoImagen.".png";
			$objetosArray[] = [$objeto[0],$imagen];
		}
		return $objetosArray;
	} catch (PDOException $ex) {
		echo $ex->getMessage();
		return false;
	}
}
function obtenerDatos($objeto){
	global $conexion;
	$objetoInfo = array();
	try {
		$obtenerInfo = $conexion->prepare("SELECT * FROM objects WHERE name = :objeto;");
		$obtenerInfo->bindParam(':objeto', $objeto);
		$obtenerInfo->execute();
		$informacion=$obtenerInfo->fetchAll();
		foreach ($informacion as $objeto) {
			$type = "";
			if($objeto[3]){
				$type = "Active Items";
			}else{
				$type = "Passive Items";
			}
			if(str_starts_with($objeto[1],"<") && str_ends_with($objeto[1], "3")){
				$objetoImagen = str_replace("<3", "Less Than Three", $objeto[1]);
			}else{
				$objetoImagen = $objeto[1];
			}
			$id = $objeto[0];
			$nombre = $objeto[1];
			$imagen = "/".$type."/".$objetoImagen;
			$quality = $objeto[2];
			$pool = $objeto[4];
			$description = $objeto[5];
			$unlock = $objeto[7];
			$release = $objeto[8];
			$objetoInfo[] = [$id,$type,$nombre,$imagen,$quality,$pool,$description,$unlock,$release];
		}
		return $objetoInfo;
	} catch (PDOException $ex) {
		echo $ex->getMessage();
		return false;
	}
}
function obtenerDescripcion($id){
	global $conexion;
	try {
		$obtenerInfo = $conexion->prepare("SELECT id FROM objects WHERE name = :nombre;");
		$obtenerInfo->bindParam(':nombre', $id);
		$obtenerInfo->execute();
		$identificador=$obtenerInfo->fetchColumn();
		$obtenerDescripcion = $conexion->prepare("SELECT descripcion_detallada FROM descripcion_detallada_objeto WHERE id_objeto = :objeto;");
		$obtenerDescripcion->bindParam(':objeto', $identificador);
		$obtenerDescripcion->execute();
		$informacion=$obtenerDescripcion->fetchColumn();
		return $informacion;
	} catch (PDOException $ex) {
		echo $ex->getMessage();
		return false;
	}
}
?>