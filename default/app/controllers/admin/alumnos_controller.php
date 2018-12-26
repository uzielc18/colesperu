<?php 
View::template('backend/backend');
class AlumnosController extends ScaffoldController
{
	public $model='alumnos';
	public $columns='id,nombres,apellido_paterno,apellido_materno,dni,codigo_estudiante,estado';
}
?>