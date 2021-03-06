<?php
View::template('backend/backend');

class UsuariosController extends AdminController {
    
    protected function before_filter() {
        if ( Input::isAjax() ){
			//View::response('view');
            //View::select('view', NULL);
        }
    }

    public function index($pagina = 1) {
        try {
            $usr = new Users();
            $this->usuarios = $usr->obtener_usuarios($pagina);
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function perfil() {
        try {

            $usr = new Users();
			$dat= new Acldatos();
            $this->usuario1 = $usr->find_first(Auth::get('id'));
			$this->datos = $dat->find_first('conditions: id='.Auth::get('acldatos_id'));
            if (Input::hasPost('usuario1')) {
                if ($usr->update(Input::post('usuario1'))) {
                    //Flash::valid('Datos Actualizados Correctamente');
                    $this->usuario1 = $usr;
                }
				if (Input::hasPost('datos')) {
					$dat->fnacimiento=Input::post('anio').'-'.Input::post('mes').'-'.Input::post('dia');
					$dat->nombre=$usr->name;
                    $dat->correo=$usr->email;
                    if ($dat->update(Input::post('datos'))) {
                        Flash::valid('Datos Actualizados Correctamente');
                        return Redirect::toAction('perfil');
                        $this->datos = $dat;
                    }
				}
            } else if (Input::hasPost('usuario2')) {
                if ($usr->cambiar_clave(Input::post('usuario2'))) {
                    Flash::valid('Clave Actualizada Correctamente');
                    $this->usuario1 = $usr;
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        try {
             if (Input::hasPost('usuario')) {
                $dato_usr=Input::post('usuario');
                $dat = new Acldatos(Input::post('dato'));
                $dat->estado='1';
                $dat->correo=$dato_usr['email'];
                $dat->userid=Auth::get('id');
                if ($dat->save()) {
					$usr= new Users(Input::post('usuario'));
                    $usr->name=$dat->nombre.' '.$dat->appaterno;
                    $usr->clave=md5('123456');
                    $usr->password='123456';
                    $usr->aclempresas_id=$dat->aclempresas_id;
                    //$usr->email=$dat->correo;
                    $usr->dni=$dat->dni;
                    $usr->picture='avatar2.png';
                    $usr->activo='0';
                    $usr->acldatos_id=$dat->id;
					
					if ($usr->save()) {
						//Flash::valid('Datos Actualizados Correctamente');
					}
                    Flash::valid('El Usuario Ha Sido Agregado Exitosamente...!!!');
                    //Acciones::add("Agregó al usuario {$usr->login} al sistema", 'usuarios');
                    return Redirect::to();
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function editar($id) {
        try {
            View::select('crear');
            $id = Filter::get($id, 'digits');

            $usr = new Users();
			$dat= new Acldatos();//Input::post('datos')
            $this->usuario = $usr->find((int) $id);
			$this->dato = $dat->find((int) $id);
            if (Input::hasPost('usuario')) {
					$usr->userid=Auth::get('id');
				if ($usr->update(Input::post('usuario'))){
					$dat->correo=$usr->email;
                    $dat->aclempresas_id=$usr->aclempresas_id;
					$dat->update(Input::post('dato'));
                    Flash::valid('El Usuario Ha Sido Actualizado 
					Exitosamente...!!!');
                    //Acciones::add("Editó al usuario {$usr->login}", 'usuarios');
                    return Redirect::to();
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                    unset($this->usuario); //para que cargue el $_POST en el form
                }
            } else if (!$this->usuario) {
                Flash::warning("No existe ningun usuario con id '{$id}'");
                return Redirect::to();
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function activar($id) {
        try {
            $id = Filter::get($id, 'digits');
            $usuario = new Users();
            if (!$usuario->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun usuario con id '{$id}'");
            }else if ($usuario->activar()) {
                Flash::valid("La Cuenta del Usuario {$usuario->login} ({$usuario->nombres}) fué activada...!!!");
                Acciones::add("Colocó al usuario {$usuario->login} como activo", 'usuarios');
            } else {
                Flash::warning('No se Pudo Activar la cuenta del Usuario...!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('');
    }

    public function desactivar($id) {
        try {
            $id = Filter::get($id, 'digits');
            $usuario = new Users();
            if (!$usuario->find_first($id)){ //si no existe el usuario
                Flash::warning("No existe ningun usuario con id '{$id}'");
            }else if ($usuario->desactivar()) {
                Flash::valid("La Cuenta del Usuario {$usuario->login} ({$usuario->nombres}) fué desactivada...!!!");
                Acciones::add("Colocó al usuario {$usuario->login} como inactivo", 'usuarios');
            } else {
                Flash::warning('No se Pudo Desactivar la cuenta del Usuario...!!!');
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::toAction('');
    }
	 public function eliminar($id) {
        try {
            $id = Filter::get($id, 'digits');

            $usuario = new Users();

            if (!$usuario->find_first($id)) { //si no existe
                Flash::warning("No existe ningun Usuario con id '{$id}'");
            } else if ($usuario->delete()) {
                Flash::valid("El Usuario <b>{$usuario->usuario}</b> fué Eliminado...!!!");
                Acciones::add("Eliminó el Usuario {$usuario->usuario} del sistema", 'aclusuarios');
            } else {
                Flash::warning("No se Pudo Eliminar el Usuario <b>{$usuario->ususario}</b>...!!!");
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Redirect::to();
    }
	
	public function areas($id=0)
	{
		$this->areas=new Plareas();
		$this->id=$id;
	}
	public function tesdatos($id=0)
	{
		$datos=new Tesdatos();
		$this->datos=$datos->find('conditions: aclempresas_id=1','order: ruc,razonsocial ASC');
	}
    public function restClave($id=0){
        if($id!=0){
            $usr= (new Users)->find_first($id);
            $usr->clave=md5('123456');
            $usr->save();
            Flash::valid("El Usuario <b>{$usr->usuario}</b> su clave fue restablecida a 123456");
            return Redirect::to();
        }
    }
}
