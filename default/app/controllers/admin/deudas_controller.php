<?php 
View::template('backend/backend');
class DeudasController extends ScaffoldController
{
	public $model='deudas';
	public $columns='id,anio,mes,descripcion,estado';
}
?>