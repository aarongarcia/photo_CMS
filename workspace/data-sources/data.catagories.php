<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcecatagories extends Datasource{
		
		public $dsParamROOTELEMENT = 'catagories';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'order';
		public $dsParamSTARTPAGE = '1';
		public $dsParamINCLUDEDELEMENTS = array(
				'order',
				'url'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Catagories',
					 'author' => array(
							'name' => 'Aaron Garcia',
							'website' => 'http://localhost:8888/kelseyfoster.net',
							'email' => 'aarong@eyegatemedia.com'),
					 'version' => '1.0',
					 'release-date' => '2009-09-03T22:28:30+00:00');	
		}
		
		public function getSource(){
			return '2';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

