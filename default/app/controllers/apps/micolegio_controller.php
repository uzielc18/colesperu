<?php
View::template('apps/default_app');
class MicolegioController extends AdminController {
	
	public function index($page=1){
		$Colegios= new Colegios();
        $Deudas= new Deudas();
		$this->colegio=$Colegios->find_first('conditions: id = '.Auth::get('aclempresas_id'));
		
        $this->deudas=$Deudas->getIncidencias();
	}
     public function alumnos($page=1){
        $Colegios= new Colegios();
        $Alumnos= new Alumnos();
        $this->colegio=$Colegios->find_first('conditions: id = '.Auth::get('aclempresas_id'));
        $this->alumnos=$Alumnos->find('conditions: aclempresas_id='.Auth::get('aclempresas_id'));
       
    }
	public function editar() {
        $Colegios= new Colegios();
        $this->colegio=$Colegios->find_first('conditions: id = '.Auth::get('aclempresas_id'));
        $id=Auth::get('aclempresas_id');
        $this->titulo = 'Editar Empresa';
        try {
            //View::select('crear');

            $em = new Aclempresas();
            $cl = new Colegios();

            $this->aclempresas = $em->find_first($id);
            $this->colegios = $cl->find_first($id);

            if (Input::hasPost('aclempresas')) {
                    $em->userid=Auth::get('id');
                if ($em->update(Input::post('aclempresas'))) {
                    Flash::valid('La Empresa fué actualizada Exitosamente...!!!');
                    Acciones::add("Editó la Empresa {$em->nombre}", 'aclempresas');
                    if (Input::hasPost('colegios')) {
                        $cl->aclempresas_id=$id;
                        if ( $cl->update(Input::post('colegios'))) {
                            Flash::valid('El Colegio fué actualizada Exitosamente...!!!');
                            Acciones::add("Editó el colegio {$cl->nombre}", 'aclempresas');
                            return Redirect::to();
                        } else {
                            Flash::warning('No se Pudieron Guardar los Datos...!!!');
                            unset($this->em); //para que cargue el $_POST en el form
                        }
                    }
                    return Redirect::to();
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                    unset($this->em); //para que cargue el $_POST en el form
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
    public function registrar_alumno(){
        try {
            $this->titulo = 'Registrar Alumno e incidencias';
            $this->ver_form_alumnos=True;
            $this->ver_form_deuda =True;
            if (Input::hasPost('alumnos')) {
                $alumno = new Alumnos(Input::post('alumnos'));
                if ($alumno->save()) {
                    Flash::valid('El Recurso Ha Sido Agregado Exitosamente...!!!');
                    //
                    //Acciones::add("Agregó al Recurso {$alumno->id} al Sistema", 'alumnos');
                    $deuda = new Deudas(Input::post('deudas'));
                    $deuda->alumnos_id=$alumno->id;
                    $deuda->save();
                    return Redirect::toAction('alumnos');
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
    public function editar_alumno($id){
        try {
            View::select('registrar_alumno');
            $this->titulo = 'Registrar Alumno e incidencias';

            if (Input::hasPost('alumnos')) {
                $alumno = new Alumnos(Input::post('alumnos'));
                if ($alumno->save()) {
                    Flash::valid('El Recurso Ha Sido Agregado Exitosamente...!!!');
                    return Redirect::toAction('alumnos');
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }

            $this->alumnos = (new Alumnos)->find_first((int)$id);
            $this->ver_form_deuda = False;
            $this->ver_form_alumnos = True;
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }
   
    public function registrar_incidencia($id){
        try {

            View::select('registrar_alumno');
            $this->titulo = 'Registrar incidencias';

            if (Input::hasPost('deudas')) {
                $deuda = new Deudas(Input::post('deudas'));
                $deuda->alumnos_id=$id;
                if ($deuda->save()) {
                    Flash::valid('La incidencia fue registrada ha Sido Agregado Exitosamente...!!!');
                  return Redirect::toAction('alumnos');
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
            $this->alumno = (new Alumnos)->find_first((int)$id);
            $this->ver_form_deuda = True;
            $this->ver_form_alumnos = False; 
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

}
?>