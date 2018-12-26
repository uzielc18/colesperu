<?php
class Estados extends ActiveRecord {

    public function initialize() {
        //relaciones;
        $this->has_many('deudas');
        //$this->belongs_to('estados');
		
    }
    public function getTotal(){
    	$a=$this->find_by_sql('select count(id) as c from deudas WHERE deudas.estados_id='.$this->id);
    	return $a->c;
    }

    
}
?>