<?php
class Alumnos extends ActiveRecord {

    public function initialize() {
        //relaciones;
        //$this->belongs_to('colegios');
        $this->belongs_to('colegios', 'model: Colegios', 'fk: aclempresas_id');
        $this->has_many('deudas');
        //$this->has_one('deudas');
        //$this->has_one('aclusarios');
		
    }

    public function getTotalIncidencias(){
    	$cc=$this->find_by_sql('select count(id) as c from deudas WHERE deudas.alumnos_id='.$this->id);
    	return $cc->c;
    }

    
}
?>