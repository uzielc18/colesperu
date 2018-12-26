<?php 
View::template('backend/backend');
class EstadosController extends ScaffoldController
{
	public $model='estados';
	public $columns='id,nombre,estado,codigo';
}
?>