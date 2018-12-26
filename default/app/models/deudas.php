<?php
class Deudas extends ActiveRecord {

    public function initialize() {
        //relaciones;
        $this->belongs_to('alumnos');
        $this->belongs_to('estados');
        $this->belongs_to('colegios');
		
    }
    public function getIncidencias(){
        return $this->find_all_by_sql("SELECT deudas.id as deuda_id, alumnos.id as alumno_id, alumnos.nombres as nombres,alumnos.apellido_paterno as paterno,alumnos.apellido_materno as materno, deudas.created_at as creacion, deudas.descripcion as descripcion, deudas.colegios_id as colegios_id, alumnos.codigo_estudiante as codigo, alumnos.dni as dni FROM `deudas` INNER JOIN alumnos ON alumnos.id=deudas.alumnos_id INNER JOIN estados ON estados.id=deudas.estados_id INNER JOIN colegios ON colegios.id=alumnos.aclempresas_id WHERE alumnos.aclempresas_id=".Auth::get('aclempresas_id').' order by deudas.created_at DESC');
    }
    public function getIncidenciasAll(){
        return $this->find_all_by_sql("SELECT deudas.id as deuda_id, alumnos.id as alumno_id, alumnos.nombres as nombres,alumnos.apellido_paterno as paterno,alumnos.apellido_materno as materno, deudas.created_at as creacion, deudas.descripcion as descripcion, estados.id as estados_id, deudas.colegios_id as colegios_id, alumnos.codigo_estudiante as codigo, alumnos.dni as dni   FROM `deudas` INNER JOIN alumnos ON alumnos.id=deudas.alumnos_id INNER JOIN estados ON estados.id=deudas.estados_id INNER JOIN colegios ON colegios.id=alumnos.aclempresas_id WHERE 1=1 order by deudas.created_at DESC limit 25 ");
    }

    public function getIncidenciasAll_buscar($q){
        return $this->find_all_by_sql("SELECT deudas.id as deuda_id, alumnos.id as alumno_id, alumnos.nombres as nombres,alumnos.apellido_paterno as paterno,alumnos.apellido_materno as materno, deudas.created_at as creacion, deudas.descripcion as descripcion, estados.id as estados_id, deudas.colegios_id as colegios_id, alumnos.codigo_estudiante as codigo, alumnos.dni as dni  FROM `deudas` INNER JOIN alumnos ON alumnos.id=deudas.alumnos_id INNER JOIN estados ON estados.id=deudas.estados_id INNER JOIN colegios ON colegios.id=alumnos.aclempresas_id WHERE (alumnos.nombres like '%".$q."%' or alumnos.apellido_paterno like '%".$q."%' or alumnos.apellido_materno like '%".$q."%'  or alumnos.dni like '%".$q."%'  or alumnos.codigo_estudiante like '%".$q."%') order by deudas.created_at DESC limit 25 ");
    }

    
}
?>