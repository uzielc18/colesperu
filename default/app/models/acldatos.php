<?php
class Acldatos extends ActiveRecord {

    public function initialize() {
        //relaciones;
        $this->belongs_to('aclempresas');
        //$this->has_many('aclusarios');
        $this->has_one('filiaciones');
        //$this->has_one('aclusarios');
		$this->validates_presence_of('nombre', 'message: Debe escribir un <b>Nombre</b> para el Trabajador');
        $this->validates_presence_of('appaterno', 'message: Debe escribir el <b>Primir Apellido</b>');
        $this->validates_presence_of('apmaterno', 'message: Debe escribir el <b>Segundo Apellido</b>');
        $this->validates_presence_of('dni', 'message: Debe ingresar su <b> DNI </b>');
		$this->validates_presence_of('aclempresas_id', 'message: Debe seleccionar una <b>Empresa</b>');
    }

    
}
?>