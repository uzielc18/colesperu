<?php
class Ugeles extends ActiveRecord {

    public function initialize() {
        //relaciones;
        $this->has_many('colegios');
        //$this->has_one('aclusarios');
		
    }

    
}
?>