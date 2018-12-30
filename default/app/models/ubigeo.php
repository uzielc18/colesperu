<?php
class Ubigeo extends ActiveRecord {

    public function initialize() {
        $this->has_many('colegios');
    }
    public function get_ubigeo($q){
    	return $this->find_all_by_sql('SELECT ubigeo.*, CONCAT_WS(" ",ubigeo.departamento, ubigeo.provincia, ubigeo.distrito) as resultado FROM ubigeo WHERE ubigeo.distrito like "%'.$q.'%" ORDER BY distrito ASC');
    }
    public function get_resultado(){
    	$a=$this->find_by_sql('SELECT CONCAT_WS("\/",ubigeo.departamento, ubigeo.provincia, ubigeo.distrito) as resultado FROM ubigeo WHERE ubigeo.id='.$this->id);
    	return $a->resultado;
    }
    public function get_allUbigeo(){
        return $this->find_all_by_sql('SELECT ubigeo.id, CONCAT_WS("\/",ubigeo.departamento, ubigeo.provincia, ubigeo.distrito) as resultado FROM ubigeo WHERE 1=1 order by ubigeo.departamento, ubigeo.provincia');
    }
}
?>