<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcephotos extends Datasource{
		
		public $dsParamROOTELEMENT = 'photos';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '4';
		public $dsParamLIMIT = '100';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'categories';
		public $dsParamSORT = 'order';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'5' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'order',
				'categories',
				'description',
				'publish',
				'upload-photo'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Photos',
					 'author' => array(
							'name' => 'Aaron Garcia',
							'website' => 'http://localhost:8888/kelseyfoster.net',
							'email' => 'aarong@eyegatemedia.com'),
					 'version' => '1.0',
					 'release-date' => '2009-08-16T15:13:27+00:00');	
		}
		
		public function getSource(){
			return '1';
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

