<?php
View::template('apps/default_app');
class BuscadorController extends AdminController {
	
	public function index(){
		$this->estados=(new Estados)->find();
        $Deudas = new Deudas();
        $this->deudas=$Deudas->getIncidenciasAll();
	}
	public function resultados(){
	 	View::template(NULL); 
		//$this->data[] = [];
		$q=$_GET['q'];
		//$q='Jos';
		$obj = new Deudas();
		$estados=(new Estados)->find();
		$deudas = $obj->getIncidenciasAll_buscar($q);
		$n=0;
		$html_salida='<ul class="products-list product-list-in-box">';	
		foreach ($deudas as $deuda)
		{
	        $html_salida.='<li class="item">';
	        $html_salida.='<div class="product-img">';
	        $html_salida.='<img class="img-circle img-bordered-sm" src="/img/'.$deuda->sexo.'.png" alt="user image">';
	        $html_salida.='</div>';
	        $html_salida.='<div class="product-info">';
	        $html_salida.='<a href="/apps/buscador/alumno/'.$deuda->alumno_id.'" class="product-title">'.$deuda->nombres.' '.$deuda->paterno.' '.$deuda->materno;
	        $html_salida.='<span class="label label-primary">'.$deuda->creacion.'</span></a>';
	        
	        $html_salida.='<span class="pull-right">';
	        foreach($estados as $estado){
	        $html_salida.='<a href="javascript:;" class="btn btn-app ';
	        $html_salida.=$estado->id==$deuda->estados_id ? $estado->color.' ': ' disabled';
	        $html_salida.='">';
	        $html_salida.='<i class="'.$estado->icono.'"></i>'.$estado->nombre;
	        $html_salida.='</a>';
	        }
	        if($deuda->colegios_id==Auth::get('aclempresas_id')){
	        $html_salida.='<a class="btn btn-app" href="/apps/buscador/eliminar/'.$deuda->deuda_id.'/'.$deuda->alumno_id.'">';
	        $html_salida.='<i class="fa fa-trash"></i> Eliminar';
	        $html_salida.='</a>';
	    	}

	        $html_salida.='</span>';
	        $html_salida.='<span class="product-description">DNI del estudiante:'.$deuda->dni.'<br> Codigo del estudiante:'.$deuda->codigo.'<br>'.$deuda->descripcion.'</span>';
	        $html_salida.='</div>';
	        $html_salida.='</li>';
	    }
	    $html_salida.='</ul>';
		$this->data= $html_salida;
	}
	public function eliminar($i_deuda,$id_alumno) {
        if((new Deudas)->count('conditions: alumnos_id='.$id_alumno)>1){
        	if (!(new Deudas)->delete((int) $i_deuda)) {
	            Flash::error('Falló Operación');
	        }
        }
        
        if((new Deudas)->count('conditions: alumnos_id='.$id_alumno)==1){
        	if (!(new Deudas)->delete((int) $i_deuda)) {
	            Flash::error('Falló Operación');
	        }
	        if (!(new Alumnos)->delete((int) $id_alumno)) {
	            Flash::error('Falló Operación');
	        }
	    }
        //enrutando al index para listar los articulos
        Redirect::toAction('index');
    }
    public function eliminar_deuda($i_deuda,$id_alumno) {
        
        if (!(new Deudas)->delete((int) $i_deuda)) {
	            Flash::error('Falló Operación');
	    }
        //enrutando al index para listar los articulos
        Redirect::toAction('alumno/'.$id_alumno);
    }
    public function cambiar_estados($id,$url){
    	$obj=(new Deudas)->find_first($id);
    	$obj->estados_id=$id;
    	if ($obj->update($obj)) {
	            Redirect::toAction('index');
	        }
    }

    public function alumno($id){
    	$Alumnos= new Alumnos();
    	$Deudas= new Deudas();
    	$Colegios= new Colegios();
    	$this->alumno=$Alumnos->find_first($id);
		$this->colegio=$Colegios->find_first('conditions: id = '.$this->alumno->aclempresas_id);
    	$this->deudas=$Deudas->find('conditions: alumnos_id='.$id);
    }
    
}
?>