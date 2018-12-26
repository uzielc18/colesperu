<?php
class Colegios extends ActiveRecord {

    public function initialize() {
        //relaciones;
        $this->belongs_to('ugeles');
        $this->has_many('alumnos');
        $this->has_many('deudas');
        $this->belongs_to('aclempresas');
        //$this->has_one('aclusarios');
		
    }

    
}
?>