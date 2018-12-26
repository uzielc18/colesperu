<?php 
View::template('backend/backend');
class UgelesController extends ScaffoldController
{
	public $model='ugeles';
	public $columns='id,nombre,codigo_unico,localidad,direccion,estado';
}
?>