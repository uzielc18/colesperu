<?php 
View::template('backend/backend');
class AdmcolegiosController extends ScaffoldController
{
	public $model='colegios';
	public $columns='id,nombre,codigo_local,codigo_modular,direccion,estado';
}
?>