<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceabout extends Datasource{
		
		public $dsParamROOTELEMENT = 'about';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		public $dsParamINCLUDEDELEMENTS = array(
				'heading',
				'body: formatted',
				'phone-number',
				'email',
				'link-1-title',
				'link-1-url',
				'link-2-title',
				'link-2-url',
				'photo'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'About',
					 'author' => array(
							'name' => 'Aaron Garcia',
							'website' => 'http://localhost:8888/kelseyfoster.net',
							'email' => 'aarong@eyegatemedia.com'),
					 'version' => '1.0',
					 'release-date' => '2009-09-06T04:45:24+00:00');	
		}
		
		public function getSource(){
			return '7';
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

