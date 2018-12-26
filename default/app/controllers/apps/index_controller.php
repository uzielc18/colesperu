<?php
View::template('apps/default_app');
class IndexController extends AdminController {
	
	protected function before_filter() {
        if ( Input::isAjax() ){
			//View::response('view');
        }
    }
    public function index()
	{
		$Colegios = new Colegios();
		$Alumnos = new Alumnos();
		$Deudas = new Deudas();
		$Estados = new Estados();
		$this->col=$Colegios->count();
		$this->alm=$Alumnos->count();
		$this->estados=$Estados->find();

		$this->alumnos=$Alumnos->find('order: id DESC Limit 10');

	}
	public function bienvenida()
	{}	
}
