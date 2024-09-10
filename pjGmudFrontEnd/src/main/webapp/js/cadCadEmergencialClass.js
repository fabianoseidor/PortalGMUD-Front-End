/**
 * Class de Cadastro de Mudanca Padrao
 */
class MudancaEmergencial{
	
	constructor(){
		// Informacoes do corpo da GMUD
		this.dadosIdentMudanca      = {};
		this.acaosPosAtividades     = {}; 
		// Informacoes dos aprovadores da GMUD
		this.idAprov                = 1;
		this.listaAprovadores       = [];
		// Informacoes dos Clientes que serao Afetados na GMUD
		this.idCliAfetados          = 1;
		this.listaClientesAfetados  = []
		// Informacoes ... GMU;
		this.idPlanoComunic         = 1;
		this.listaPlanoComunicacoes = [];
		// Informacoes ... na GMU
		this.idTarefa               = 1;
		this.listaTarefas           = [];
		// Informacoes ... na GMU
		this.idArqsMudanca          = 1;
		this.listaArquivosMudanca   = [];
		// Informacoes ... na GMU
		this.idArqsMudancaAprovCliente        = 1;
		this.listaArquivosMudancaAprovCliente = [];
	}
	
	/*************************************/
	/* funcoes de validadoes para osStep */
	/*************************************/
	validacaoAprovadores(){
		if(this.listaAprovadores.length < 1 ) return true;
		return false;
	}
	
	validacaoArqClieAprovacao(){
		if(this.listaArquivosMudancaAprovCliente.length < 1 ) return true;
		return false;
	}
	
	validacaoClientesAfetados(){
		if(this.listaClientesAfetados.length < 1 ) return true;
		return false;
	}
	validacaoPlanoComunicacoes(){
		if(this.listaPlanoComunicacoes.length < 1 ) return true;
		return false;
	}
	validacaoTarefas(){
		if(this.listaTarefas.length < 1 ) return true;
		return false;
	}
	validacaoArquivosMudanca(){
		if(this.listaArquivosMudanca.length < 1 ) return true;
		return false;
	}
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*             Trata as informacoes dos Aprovadores no Step 1, para Adicionar, Editar e Deletar dentro do Arrey          */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	// Chama a API para salvar a Mudança Emergencial na base de Dados.
	salvarAcaosPosAtividades(){
		this.adicionarAcaosPosAtividadesEmergencial();
	}
	
	// Adiciona as informacoes da tela no Objeto
	adicionarAcaosPosAtividadesEmergencial(){
		this.acaosPosAtividades = this.lerDadosAcaosPosAtividades();
	}
	
	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerDadosAcaosPosAtividades(){
		let dadosAcaosPosAtividades = {};
		/* Dados de Ações pós atividades da Mudança */
        dadosAcaosPosAtividades.planoTestes  = document.getElementById( 'planoTestes'  ).value;
        dadosAcaosPosAtividades.planoRetorno = document.getElementById( 'planoRetorno' ).value;
        return dadosAcaosPosAtividades;
	}
	
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*             Trata as informacoes dos Aprovadores no Step 5, para Adicionar, Editar e Deletar dentro do Arrey          */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	// Chama a API para salvar a Mudança Emergencial na base de Dados.
	salvarMudancaEmergencial(){
		this.adicionarMudancaEmergencial();
	}
	
	// Adiciona as informacoes da tela no Objeto
	adicionarMudancaEmergencial(){
		this.dadosIdentMudanca = this.lerDadosIdentificacaoMudanca();
	}
	
	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerDadosIdentificacaoMudanca(){
		let dadosIdentificacaoMudanca = {};
		/* Dados de Identificação da Mudança */
        dadosIdentificacaoMudanca.tituloMudanca            = document.getElementById   ( 'tituloMudanca'            ).value;
        dadosIdentificacaoMudanca.statusMudanca            = 'ABERTA'                                                      ;
        dadosIdentificacaoMudanca.login                    = document.getElementById   ( 'login'                    ).value;
        dadosIdentificacaoMudanca.emailSolicitante         = document.getElementById   ( 'emailSolicitante'         ).value;
        
        /* Dados de Impacto da Mudança */
        dadosIdentificacaoMudanca.idTipoMudanca            = "2"                                                           ;
        dadosIdentificacaoMudanca.tipoMudanca              = 'Emergencial'                                                      ;
        dadosIdentificacaoMudanca.idImpactoMudanca         = document.getElementById   ( "impactoMudanca"           ).value;
        dadosIdentificacaoMudanca.impactoMudanca           = $('#impactoMudanca').find ( ":selected").text( )              ;
        dadosIdentificacaoMudanca.idUrgenciaMudanca        = document.getElementById   ( "urgenciaMudanca"          ).value;
        dadosIdentificacaoMudanca.urgenciaMudanca          = $('#urgenciaMudanca').find( ":selected").text( )              ;
        /* Dados de Impacto da Mudança */
        dadosIdentificacaoMudanca.dataExecucao             = document.getElementById   ( "dataExecucao"             ).value;
        dadosIdentificacaoMudanca.horarioInicio            = document.getElementById   ( "horarioInicio"            ).value;
        dadosIdentificacaoMudanca.dataPrevistaConclusao    = document.getElementById   ( "dataPrevistaConclusao"    ).value;
        dadosIdentificacaoMudanca.HorarioPrevistoConclusao = document.getElementById   ( "HorarioPrevistoConclusao" ).value;
        dadosIdentificacaoMudanca.descricaoMudanca         = document.getElementById   ( "descricaoMudanca"         ).value;
        dadosIdentificacaoMudanca.justificativaMudanca     = document.getElementById   ( "justificativaMudanca"     ).value;
        
        return dadosIdentificacaoMudanca;
	}

 
 
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*             Trata as informacoes dos Aprovadores no Step 2, para Adicionar, Editar e Deletar dentro do Arrey          */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarAprovadores(){
		let aprovadore = this.lerDadosAprovadores();
		if( this.validaCamposAprovadores(aprovadore) ){
			this.adicionarAprovadores(aprovadore);
			this.listaTabelaAprvadores( this.listaAprovadores );
			this.LimparTelaAprovadores();
		}
		// console.log(this.listaClientesAfetados);
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarAprovadores(aprovadore){
		this.listaAprovadores.push(aprovadore);
        this.idAprov++;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosAprovadores(){
		let aprovadores = {};
		aprovadores.idAprov        = this.idAprov;
		aprovadores.idAprovadores  = document.getElementById   ( 'idAprovador'    ).value;
		aprovadores.nomeAprovador  = document.getElementById   ( 'nomeAprovador'  ).value;
		aprovadores.emailAprovador = document.getElementById   ( 'emailAprovador' ).value;
		return aprovadores;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaCamposAprovadores(aprovadore){
		let msg = null;
		if(aprovadore.idAprovadores == ''){
		   msg = 'Favor Selecionar um Aprovador para a Mudança!';		  
		}
		
		for(let i = 0; i < this.listaAprovadores.length; i++){
	      if( this.listaAprovadores[i].idAprovadores === aprovadore.idAprovadores ){
		      msg = 'Este Aprovador já foi selecionado!';
		      break;
	      }
        }
        if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "Seleção de Aprovadores", msg ) ;  
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaAprvadores( listaAprovadores ){
		let tbody = document.getElementById('tbAprovadores');
		tbody.innerText = '';
		
		for(let i = 0; i < listaAprovadores.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_idAprovadorShow = tr.insertCell();
	        let td_AprovadorShow   = tr.insertCell();
	        let td_Email           = tr.insertCell();
	        let td_delete          = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_idAprovadorShow.innerText = ( listaAprovadores[i].idAprovadores  !== undefined ? listaAprovadores[i].idAprovadores  : '' );
            td_AprovadorShow.innerText   = ( listaAprovadores[i].nomeAprovador  !== undefined ? listaAprovadores[i].nomeAprovador  : '' );
            td_Email.innerText           = ( listaAprovadores[i].emailAprovador !== undefined ? listaAprovadores[i].emailAprovador : '' );
			////////////////////////////////////////////////////////////////////
			td_idAprovadorShow.setAttribute('style', 'vertical-align: middle' );
			td_AprovadorShow.setAttribute  ('style', 'vertical-align: middle' );
			td_Email.setAttribute          ('style', 'vertical-align: middle' );
			td_delete.setAttribute         ('style', 'vertical-align: middle' );
            ////////////////////////////////////////////////////////////////////
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deleteAprovadores( ' +  listaAprovadores[i].idAprov + ' )');
            td_delete.appendChild(imgDelete);
            
            td_delete.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleteAprovadores ( id ){
		
	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbAprovadores');
			  			  
			  for(let i = 0; i < this.listaClientesAfetados.length; i++){
				  if( this.listaClientesAfetados[i].idAprov === id ){
					  this.listaClientesAfetados.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaAprovadores() {

		$('#selectAprovadores').get(0).selectedIndex = 0;
		$("#idAprovador"      ).val("");
		$("#nomeAprovador"    ).val("");
		$("#emailAprovador"   ).val("");
		
    }
 	
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes de "Clientes afetados" no Step 3, para Adicionar, Editar e Deletar dentro do Arrey               */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarClientesAfetado(){
		let clientesAfetado = this.lerDadosClientesAfetado();
		if( this.validaClientesAfetado(clientesAfetado) ){
			this.adicionarClientesAfetado(clientesAfetado);
			this.listaTabelaClientesAfetado( this.listaClientesAfetados );
			this.LimparTelaClientesAfetados();
		}
		// console.log(this.listaClientesAfetados);
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	limparListaClientesAfetados(){
		this.listaClientesAfetados.length = 0;
		this.idCliAfetados = 0;
		this.listaTabelaClientesAfetado( this.listaClientesAfetados );
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarClientesAfetado(clientesAfetado){
		this.listaClientesAfetados.push(clientesAfetado);
        this.idCliAfetados++;
 
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosClientesAfetado(){
		let clientesAfetado = {};
		clientesAfetado.idCliAfetados = this.idCliAfetados;
		clientesAfetado.idClienteAfet = document.getElementById   ( 'idClienteAfetado'   ).value;
		clientesAfetado.clienteAfet   = document.getElementById   ( 'nomeClienteAfetado' ).value;
		clientesAfetado.cicloUpdate   = '';
		return clientesAfetado;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaClientesAfetado(clientesAfetado){
		let msg = null;
		if(clientesAfetado.idClienteAfet == ''){
		   msg = 'Favor Selecionar um Cliente que será Afetado pela Mudança!';
		}
		
		for(let i = 0; i < this.listaClientesAfetados.length; i++){
	      if( this.listaClientesAfetados[i].idClienteAfet === clientesAfetado.idClienteAfet ){
		      msg = 'Este Cliente já foi selecionado!';
		      break;
	      }
        }
        
        if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Clientes Afetado", msg ) ; 
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaClientesAfetado( listaClientesAfetados ){
		let tbody = document.getElementById('tbClienteAfetado');
		tbody.innerText = '';
		
		for(let i = 0; i < listaClientesAfetados.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_idClienteAfetShow = tr.insertCell();
	        let td_clienteAfetShow   = tr.insertCell();
			let td_cicloUpdateShow   = tr.insertCell();
	        let td_delete            = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_idClienteAfetShow.innerText = ( listaClientesAfetados[i].idClienteAfet !== undefined ? listaClientesAfetados[i].idClienteAfet : '' );
            td_clienteAfetShow.innerText   = ( listaClientesAfetados[i].clienteAfet   !== undefined ? listaClientesAfetados[i].clienteAfet   : '' );
			td_cicloUpdateShow.innerText   = ( listaClientesAfetados[i].cicloUpdate   !== ''        ? listaClientesAfetados[i].cicloUpdate   : ' - ' );
			////////////////////////////////////////////////////////////////////
			td_idClienteAfetShow.setAttribute('style', 'vertical-align: middle' );
			td_clienteAfetShow.setAttribute  ('style', 'vertical-align: middle' );
			td_delete.setAttribute           ('style', 'vertical-align: middle' );
			
			if(listaClientesAfetados[i].cicloUpdate   === '' ) td_cicloUpdateShow.setAttribute('style', 'vertical-align: middle; text-align:center' );
						else td_cicloUpdateShow.setAttribute('style', 'vertical-align: middle' );
			////////////////////////////////////////////////////////////////////
			
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deleteClientesAfetado( ' +  listaClientesAfetados[i].idCliAfetados + ' )');
            td_delete.appendChild(imgDelete);
            
            td_delete.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleteClientesAfetado ( id ){
		
	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbClienteAfetado');
			  			  
			  for(let i = 0; i < this.listaClientesAfetados.length; i++){
				  if( this.listaClientesAfetados[i].idCliAfetados === id ){
					  this.listaClientesAfetados.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaClientesAfetados() {

		$('#selectClientesAfetados').get(0).selectedIndex = 0;
		$("#idClienteAfetado"      ).val("");
		$("#nomeClienteAfetado"    ).val("");
		
    }
 	
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes das "Tarefas" da Mudanca no Step 4, para Adicionar, Editar e Deletar dentro do Arrey             */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarTarefa(){
		let tarefa = this.lerDadosTarefa();
		if( this.validaTarefa( tarefa) ){
			this.adicionarTarefa(tarefa);
			this.listaTabelaTarefa( this.listaTarefas );
			this.LimparTelaTarefa();
		}

		// console.log(this.listaClientesAfetados);
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarTarefa(tarefa){
		this.listaTarefas.push(tarefa);
        this.idTarefa++;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosTarefa(){
		let tarefa = {};
		tarefa.idTarefa               = this.idTarefa;
		tarefa.idResponsavelTarefa    = document.getElementById( 'idResponsavelTarefa'    ).value;
		tarefa.nomeResponsavelTarefa  = document.getElementById( 'nomeResponsavelTarefa'  ).value;
		tarefa.emailResponsavelTarefa = document.getElementById( 'emailResponsavelTarefa' ).value;
		tarefa.tituloTarefa           = document.getElementById( 'tituloTarefa'           ).value;
		tarefa.dataTarefa             = document.getElementById( 'dataTarefa'             ).value;
		tarefa.duracaoTarefa          = document.getElementById( 'duracaoTarefa'          ).value;
		tarefa.descricaoTarefa        = document.getElementById( 'descricaoTarefa'        ).value;
		tarefa.prioridade             = document.getElementById( 'prioridade'             ).value;
		tarefa.enviarEmail            = inlineCheckbox3.checked;
		tarefa.tarefaAutomatica       = inlineCheckbox2.checked;
		tarefa.indisponibilidade      = checkBoxIndisp.checked;
		return tarefa;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaTarefa(tarefa){
		let msg = null;
		if( tarefa.idResponsavelTarefa == ''){
		   msg = 'Favor Selecionar um responsavel pela execução da "Tarefa"!';
		}
		
		if( tarefa.prioridade == ''){
		   msg = 'Favor informar o valor da "Prioridade"!';
		}

		if( tarefa.tituloTarefa.trim() == ''){
		   msg = 'Favor informar o Título da "Tarefa"!';
		}
		if( tarefa.dataTarefa.trim() == ''){
		   msg = 'Favor informar a Data da "Tarefa"!';
		}
		if( tarefa.duracaoTarefa.trim() == ''){
		   msg = 'Favor informar a Duração da "Tarefa"!';
		}
		if( tarefa.duracaoTarefa.trim() == ''){
		   msg = 'Favor informar a Duração da "Tarefa"!';
		}
		if( tarefa.descricaoTarefa.trim() == ''){
		   msg = 'Favor informar a Descrição da "Tarefa"!';
		}
		        
        if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Tarefa", msg ) ;
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaTarefa( tarefas ){
		let tbody = document.getElementById('tbTarefas');
		tbody.innerText = '';
		
		for(let i = 0; i < tarefas.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_tituloTarefaShow          = tr.insertCell();
	        let td_dataTarefaShow            = tr.insertCell();
	        let td_duracaoTarefaShow         = tr.insertCell();
			let td_prioridadefa              = tr.insertCell();
			let td_indispfaShow              = tr.insertCell();
			let td_enviarEmailTarefaShow     = tr.insertCell();
			let td_tarefaAutomaticafaShow    = tr.insertCell();
	        let td_descricaoTarefaShow       = tr.insertCell();
	        let td_nomeResponsavelTarefaShow = tr.insertCell();
	        let td_delete                    = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_tituloTarefaShow.innerText          = ( tarefas[i].tituloTarefa          !== undefined ? tarefas[i].tituloTarefa          : '' );
            td_dataTarefaShow.innerText            = ( tarefas[i].dataTarefa            !== undefined ? tarefas[i].dataTarefa            : '' );
            td_duracaoTarefaShow.innerText         = ( tarefas[i].duracaoTarefa         !== undefined ? tarefas[i].duracaoTarefa         : '' );
			td_prioridadefa.innerText              = ( tarefas[i].prioridade            !== undefined ? tarefas[i].prioridade            : '' );
			td_indispfaShow.innerText              = ( tarefas[i].indisponibilidade     === true      ? 'X'                              : '' );
			td_enviarEmailTarefaShow.innerText     = ( tarefas[i].enviarEmail           === true      ? 'X'                              : '' );
			td_tarefaAutomaticafaShow.innerText    = ( tarefas[i].tarefaAutomatica      === true      ? 'X'                              : '' );
            td_descricaoTarefaShow.innerText       = ( tarefas[i].descricaoTarefa       !== undefined ? tarefas[i].descricaoTarefa       : '' );
            td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].nomeResponsavelTarefa !== undefined ? tarefas[i].nomeResponsavelTarefa : '' );
			/////////////////////////////////////////////////////////////////////////////
			td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
			td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
			td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
			td_prioridadefa.setAttribute             ('style', 'vertical-align: middle' );
			td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
			td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle' );
			td_delete .setAttribute                  ('style', 'vertical-align: middle' );
			td_enviarEmailTarefaShow.setAttribute    ('style', 'vertical-align: middle' );
			td_indispfaShow.setAttribute             ('style', 'vertical-align: middle' );
			td_tarefaAutomaticafaShow.setAttribute   ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////////////////
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deleTetarefa( ' +  tarefas[i].idTarefa + ' )');
            td_delete.appendChild(imgDelete);
            
            td_delete.classList.add('center');
			td_enviarEmailTarefaShow.classList.add('center');
			td_indispfaShow.classList.add('center');
			td_tarefaAutomaticafaShow.classList.add('center');
			td_prioridadefa.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleTetarefa ( id ){

	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbTarefas');
			  			  
			  for(let i = 0; i < this.listaTarefas.length; i++){
				  if( this.listaTarefas[i].idTarefa === id ){
					  this.listaTarefas.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaTarefa() {

		$('#selectResponsavelTarefa').get(0).selectedIndex = 0;
		$("#idResponsavelTarefa"    ).val("");
		$("#nomeResponsavelTarefa"  ).val("");
		$("#emailResponsavelTarefa" ).val("");
		$("#tituloTarefa"           ).val("");
		$("#dataTarefa"             ).val("");
		$("#duracaoTarefa"          ).val("");
		$("#descricaoTarefa"        ).val("");
		$("#prioridade"             ).val("");
		inlineCheckbox2.checked = false;
		inlineCheckbox3.checked = false;
		checkBoxIndisp.checked  = false;		
    }
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes de "Clientes afetados" no Step 3, para Adicionar, Editar e Deletar dentro do Arrey               */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarPlanoComunicacao(){
		let planoComunicacoes = this.lerDadosPlanoComunicacao();
		if( this.validaPlanoComunicacao(planoComunicacoes) ){
			this.adicionarPlanoComunicacoe(planoComunicacoes);
			this.listaTabelaPlanoComunicacoe( this.listaPlanoComunicacoes );
			this.LimparTelaPlanoComunicacoe();
		}

		// console.log(this.listaClientesAfetados);
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarPlanoComunicacoe(planoComunicacoe){
		this.listaPlanoComunicacoes.push(planoComunicacoe);
        this.idPlanoComunic++;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosPlanoComunicacao(){
		let planoComunicacao = {};
		planoComunicacao.idPlanoComunic = this.idPlanoComunic;
		planoComunicacao.pcNomeContato  = document.getElementById   ( 'pcNomeContato' ).value;
		planoComunicacao.pcEmpresa      = document.getElementById   ( 'pcEmpresa'     ).value;
		planoComunicacao.pcEmail        = document.getElementById   ( 'pcEmail'        ).value;
		return planoComunicacao;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaPlanoComunicacao(planoComunicacoe){
		let msg = null;
		if(planoComunicacoe.pcNomeContato == ''){
		   msg = 'Favor informar o Nome do Contato para o Plano de Comunicação pela Mudança!';
		}
		if(planoComunicacoe.pcEmpresa == ''){
		   msg = 'Favor informar o Nome da Empresa para como Plano de Comunicação pela Mudança!';
		}
		if(planoComunicacoe.pcEmail == ''){
		   msg = 'Favor informar um E-mail para como Plano de Comunicação pela Mudança!';
		}
		
        
        if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Plano Comunicação", msg ) ;
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaPlanoComunicacoe( listaPlanoComunicacoes ){
		let tbody = document.getElementById('tbPlanoComunicacao');
		tbody.innerText = '';
		
		for(let i = 0; i < listaPlanoComunicacoes.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_pcNomeContatoShow = tr.insertCell();
	        let td_pcEmpresaShow     = tr.insertCell();
	        let td_pcEmailShow       = tr.insertCell();
	        let td_delete            = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_pcNomeContatoShow.innerText = ( listaPlanoComunicacoes[i].pcNomeContato !== undefined ? listaPlanoComunicacoes[i].pcNomeContato : '' );
            td_pcEmpresaShow.innerText     = ( listaPlanoComunicacoes[i].pcEmpresa     !== undefined ? listaPlanoComunicacoes[i].pcEmpresa     : '' );
            td_pcEmailShow.innerText       = ( listaPlanoComunicacoes[i].pcEmail       !== undefined ? listaPlanoComunicacoes[i].pcEmail       : '' );
			/////////////////////////////////////////////////////////////////////////////
			td_pcNomeContatoShow.setAttribute('style', 'vertical-align: middle' );
			td_pcEmpresaShow.setAttribute    ('style', 'vertical-align: middle' );
			td_pcEmailShow.setAttribute      ('style', 'vertical-align: middle' );
			td_delete.setAttribute           ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////////////////
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deletePlanoComunicacoe( ' +  listaPlanoComunicacoes[i].idPlanoComunic + ' )');
            td_delete.appendChild(imgDelete);
            
            td_delete.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deletePlanoComunicacoe ( id ){

	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbPlanoComunicacao');
			  			  
			  for(let i = 0; i < this.listaPlanoComunicacoes.length; i++){
				  if( this.listaPlanoComunicacoes[i].idPlanoComunic === id ){
					  this.listaPlanoComunicacoes.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaPlanoComunicacoe() {

		$("#pcNomeContato"         ).val("");
		$("#pcEmpresa"             ).val("");
		$("#pcEmail"               ).val("");
		
    }
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/

    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes de "Arquivos" no Step 5, para Adicionar, Editar e Deletar dentro do Arrey               */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarArquivoAprovCliente(){
		let arquivoAprovCliente = this.lerDadosArquivoAprovCliente();
		if( this.validaArquivoAprovCliente(arquivoAprovCliente) ){
			this.adicionarArquivoAprovCliente(arquivoAprovCliente);
			this.listaTabelaArquivoAprovCliente( this.listaArquivosMudancaAprovCliente );
			this.LimparTelaArquivoAprovCliente();
		}
		// console.log(this.listaClientesAfetados);
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarArquivoAprovCliente(arquivo){
		this.listaArquivosMudancaAprovCliente.push(arquivo);
        this.idArqsMudancaAprovCliente++;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosArquivoAprovCliente(){
		let arquivoAprovCliente = {};
		arquivoAprovCliente.idArqsMudancaAprovCliente   = this.idArqsMudancaAprovCliente;
		arquivoAprovCliente.tituloArqAprovCliente       = document.getElementById ( 'tituloArqAprovCliente'   ).value;
		arquivoAprovCliente.nomeArqAprovCliente         = document.getElementById ( 'nomeArqAprovCliente'     ).value;
		arquivoAprovCliente.caminhoArqAprovCliente      = document.getElementById ( 'caminhoArqAprovCliente'  ).value;
		arquivoAprovCliente.extensaoArqAprovCliente     = document.getElementById ( 'extensaoArqAprovCliente' ).value;
		arquivoAprovCliente.ArquivotoBase64AprovCliente = '';

        // Get a reference to the file
        let file = this.getNameArq( 'arqUploadAprovCliente' );

        // Encode the file using the FileReader API
        let reader = new FileReader();
        reader.onloadend = () => {
            // Use a regex to remove data url part
            const base64String = reader.result;
//                .replace('data:', '')
//                .replace(/^.+,/, '');
                
//            $("#testeArq"   ).val( base64String );
            arquivoAprovCliente.ArquivotoBase64AprovCliente = base64String;
        };
        reader.readAsDataURL(file);
        
		return arquivoAprovCliente;
	}
/*	teste
	CopiaBase64(){
		
		let copiaTexto = document.getElementById("testeArq");
		copiaTexto.select();
		copiaTexto.setSelectionRange(0, 99999);
		
		navigator.clipboard.writeText(copiaTexto.value);
		
		alert("Base64 copiado!");
		
	}
*/	

	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaArquivoAprovCliente(arquivo){
		let msg = null;
		if(arquivo.nomeArquivoAprovCliente == ''){
		   msg = 'Favor Selecionar o Arquivo de Aprovação do Cliente para a Mudança!';
		}
		if(arquivo.tituloArquivAprovClienteo == ''){
		   msg = 'Favor indformar um Título de Aprovação do Cliente para o Arquivo!';
		}
		        
        if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Arquivo", msg ) ;
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaArquivoAprovCliente( listaArquivoAprovCliente ){
		let tbody = document.getElementById('tbArquivosMudancaAprovCliente');
		tbody.innerText = '';
		
		for(let i = 0; i < listaArquivoAprovCliente.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_tituloArquivoShow  = tr.insertCell();
	        let td_nomeArquivoShow    = tr.insertCell();
	        let td_caminhoArquivoShow = tr.insertCell();
	        let td_extensaoArqShow    = tr.insertCell();
	        let td_deleteArqShow             = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_tituloArquivoShow.innerText  = ( listaArquivoAprovCliente[i].tituloArqAprovCliente   !== undefined ? listaArquivoAprovCliente[i].tituloArqAprovCliente  : '' );
            td_nomeArquivoShow.innerText    = ( listaArquivoAprovCliente[i].nomeArqAprovCliente     !== undefined ? listaArquivoAprovCliente[i].nomeArqAprovCliente    : '' );
            td_caminhoArquivoShow.innerText = ( listaArquivoAprovCliente[i].caminhoArqAprovCliente  !== undefined ? listaArquivoAprovCliente[i].caminhoArqAprovCliente : '' );
            td_extensaoArqShow.innerText    = ( listaArquivoAprovCliente[i].extensaoArqAprovCliente !== undefined ? listaArquivoAprovCliente[i].extensaoArqAprovCliente: '' );
			/////////////////////////////////////////////////////////////////////////////
			td_tituloArquivoShow.setAttribute ('style', 'vertical-align: middle' );
			td_nomeArquivoShow.setAttribute   ('style', 'vertical-align: middle' );
			td_caminhoArquivoShow.setAttribute('style', 'vertical-align: middle' );
			td_extensaoArqShow.setAttribute   ('style', 'vertical-align: middle' );
			td_deleteArqShow.setAttribute     ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////////////////
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deleteArquivoAprovCliente( ' +  listaArquivoAprovCliente[i].idArqsMudancaAprovCliente + ' )');
            td_deleteArqShow.appendChild(imgDelete);
            
            td_deleteArqShow.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleteArquivoAprovCliente ( id ){

	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbArquivosMudancaAprovCliente');
			  			  
			  for(let i = 0; i < this.listaArquivosMudancaAprovCliente.length; i++){
				  if( this.listaArquivosMudancaAprovCliente[i].idArqsMudancaAprovCliente === id ){
					  this.listaArquivosMudancaAprovCliente.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaArquivoAprovCliente() {
		$("#arqUploadAprovCliente"  ).val("");
		$("#tituloArqAprovCliente"  ).val("");
		$("#nomeArqAprovCliente"    ).val("");
		$("#caminhoArqAprovCliente" ).val("");
		$("#extensaoArqAprovCliente").val("");
    }
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/

    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes de "Arquivos" no Step 5, para Adicionar, Editar e Deletar dentro do Arrey               */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	salvarArquivo(){
		let arquivo = this.lerDadosArquivo();
		if( this.validaArquivo(arquivo) ){
			this.adicionarArquivo(arquivo);
			this.listaTabelaArquivo( this.listaArquivosMudanca );
			this.LimparTelaArquivo();
		}

		// console.log(this.listaClientesAfetados);
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarArquivo(arquivo){
		this.listaArquivosMudanca.push(arquivo);
        this.idArqsMudanca++;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosArquivo(){
		let arquivo = {};
		arquivo.idArqsMudanca   = this.idArqsMudanca;
		arquivo.tituloArquivo   = document.getElementById ( 'tituloArquivo'  ).value;
		arquivo.nomeArquivo     = document.getElementById ( 'nomeArquivo'    ).value;
		arquivo.caminhoArquivo  = document.getElementById ( 'caminhoArquivo' ).value;
		arquivo.extensaoArq     = document.getElementById ( 'extensaoArq'    ).value;
		arquivo.ArquivotoBase64 = '';

        // Get a reference to the file
        let file = this.getNameArq( 'arqUpload' );

        // Encode the file using the FileReader API
        let reader = new FileReader();
        reader.onloadend = () => {
            // Use a regex to remove data url part
            const base64String = reader.result;
//                .replace('data:', '')
//                .replace(/^.+,/, '');
                
//            $("#testeArq"   ).val( base64String );
            arquivo.ArquivotoBase64 = base64String;
        };
        reader.readAsDataURL(file);
        
		return arquivo;
	}
/*	teste
	CopiaBase64(){
		
		let copiaTexto = document.getElementById("testeArq");
		copiaTexto.select();
		copiaTexto.setSelectionRange(0, 99999);
		
		navigator.clipboard.writeText(copiaTexto.value);
		
		alert("Base64 copiado!");
		
	}
*/	
	 getNameArq( arqUpload ) {	
		return document.getElementById(arqUpload).files[0];
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaArquivo(arquivo){
		let msg = null;
		if(arquivo.nomeArquivo == ''){
		   msg = 'Favor Selecionar um Arquivo para a Mudança!';
		}
		if(arquivo.tituloArquivo == ''){
		   msg = 'Favor indformar um Título para o Arquivo!';
		}
		        
        if(msg != null){
		   //alert(msg);
		   this.MensagemConfimacao( "warning", "validação Arquivo", msg ) ;
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaArquivo( listaArquivo ){
		let tbody = document.getElementById('tbArquivosMudanca');
		tbody.innerText = '';
		
		for(let i = 0; i < listaArquivo.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_tituloArquivoShow  = tr.insertCell();
	        let td_nomeArquivoShow    = tr.insertCell();
	        let td_caminhoArquivoShow = tr.insertCell();
	        let td_extensaoArqShow    = tr.insertCell();
	        let td_delete             = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_tituloArquivoShow.innerText  = ( listaArquivo[i].tituloArquivo  !== undefined ? listaArquivo[i].tituloArquivo  : '' );
            td_nomeArquivoShow.innerText    = ( listaArquivo[i].nomeArquivo    !== undefined ? listaArquivo[i].nomeArquivo    : '' );
            td_caminhoArquivoShow.innerText = ( listaArquivo[i].caminhoArquivo !== undefined ? listaArquivo[i].caminhoArquivo : '' );
            td_extensaoArqShow.innerText    = ( listaArquivo[i].extensaoArq    !== undefined ? listaArquivo[i].extensaoArq    : '' );
			/////////////////////////////////////////////////////////////////////////////
			td_tituloArquivoShow.setAttribute ('style', 'vertical-align: middle' );
			td_nomeArquivoShow.setAttribute   ('style', 'vertical-align: middle' );
			td_caminhoArquivoShow.setAttribute('style', 'vertical-align: middle' );
			td_extensaoArqShow.setAttribute   ('style', 'vertical-align: middle' );
			td_delete.setAttribute            ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////////////////
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','mudancaEmergencial.deleteArquivo( ' +  listaArquivo[i].idArqsMudanca + ' )');
            td_delete.appendChild(imgDelete);
            
            td_delete.classList.add('center');
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleteArquivo ( id ){

	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbArquivosMudanca');
			  			  
			  for(let i = 0; i < this.listaArquivosMudanca.length; i++){
				  if( this.listaArquivosMudanca[i].idArqsMudanca === id ){
					  this.listaArquivosMudanca.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaArquivo() {
		$("#arqUpload"     ).val("");
		$("#tituloArquivo" ).val("");
		$("#nomeArquivo"   ).val("");
		$("#caminhoArquivo").val("");
		$("#extensaoArq"   ).val("");
    }
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    mostraResumoTela(){
		this.montaResumoDadosIdentMudancca();
		this.montaAprovadores();
		this.montaResumoPlanoComunicacao();
		this.montaResumoTarefas();
		this.montaResumoArquivosAnexados();
		this.montaResumoArquivosAprovCliente();
		this.montaResumoAcaosPosAtividades();
//		let v_listProduto   = JSON.stringify(this.listProduto  );
//		$("#conteudoProduto").val( v_listProduto);
	}

   	montaResumoArquivosAprovCliente(){
		let tbody = document.getElementById('TbodyShowArquivosAprovCliente');
		tbody.innerText = '';
		for(let i = 0; i < this.listaArquivosMudancaAprovCliente.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
            let td_tituloArquivo  = tr.insertCell();
            let td_nomeArquivo    = tr.insertCell();
            let td_caminhoArquivo = tr.insertCell();
            let td_extensaoArq    = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_tituloArquivo.innerText  = ( this.listaArquivosMudancaAprovCliente[i].tituloArqAprovCliente   !== undefined ? this.listaArquivosMudancaAprovCliente[i].tituloArqAprovCliente  : '' );
            td_nomeArquivo.innerText    = ( this.listaArquivosMudancaAprovCliente[i].nomeArqAprovCliente     !== undefined ? this.listaArquivosMudancaAprovCliente[i].nomeArqAprovCliente    : '' );
            td_caminhoArquivo.innerText = ( this.listaArquivosMudancaAprovCliente[i].caminhoArqAprovCliente  !== undefined ? this.listaArquivosMudancaAprovCliente[i].caminhoArqAprovCliente : '' );
            td_extensaoArq.innerText    = ( this.listaArquivosMudancaAprovCliente[i].extensaoArqAprovCliente !== undefined ? this.listaArquivosMudancaAprovCliente[i].extensaoArqAprovCliente: '' );
			///////////////////////////////////////////////////////////////////
			td_tituloArquivo.setAttribute ('style', 'vertical-align: middle' );
			td_nomeArquivo.setAttribute   ('style', 'vertical-align: middle' );
			td_caminhoArquivo.setAttribute('style', 'vertical-align: middle' );
			td_extensaoArq.setAttribute   ('style', 'vertical-align: middle' );
		    ///////////////////////////////////////////////////////////////////
		}
	}

   	montaResumoArquivosAnexados(){
		let tbody = document.getElementById('TbodyShowArquivosAnexados');
		tbody.innerText = '';
		for(let i = 0; i < this.listaArquivosMudanca.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
            let td_tituloArquivo  = tr.insertCell();
            let td_nomeArquivo    = tr.insertCell();
            let td_caminhoArquivo = tr.insertCell();
            let td_extensaoArq    = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_tituloArquivo.innerText  = ( this.listaArquivosMudanca[i].tituloArquivo  !== undefined ? this.listaArquivosMudanca[i].tituloArquivo  : '' );
            td_nomeArquivo.innerText    = ( this.listaArquivosMudanca[i].nomeArquivo    !== undefined ? this.listaArquivosMudanca[i].nomeArquivo    : '' );
            td_caminhoArquivo.innerText = ( this.listaArquivosMudanca[i].caminhoArquivo !== undefined ? this.listaArquivosMudanca[i].caminhoArquivo : '' );
            td_extensaoArq.innerText    = ( this.listaArquivosMudanca[i].extensaoArq    !== undefined ? this.listaArquivosMudanca[i].extensaoArq    : '' );
			/////////////////////////////////////////////////////////////////
			td_tituloArquivo.setAttribute ('style', 'vertical-align: middle' );
			td_nomeArquivo.setAttribute   ('style', 'vertical-align: middle' );
			td_caminhoArquivo.setAttribute('style', 'vertical-align: middle' );
			td_extensaoArq.setAttribute   ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////
		}
	}
	
   	montaResumoTarefas(){
		let tbody = document.getElementById('TbodyShowTarefas');
		tbody.innerText = '';
		for(let i = 0; i < this.listaTarefas.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
            let td_tituloTarefa     = tr.insertCell();
            let td_dataTarefa       = tr.insertCell();
            let td_duracaoTarefa    = tr.insertCell();
			let td_prioridadefa     = tr.insertCell();
			let td_indispfa         = tr.insertCell();
			let td_enviarEmail      = tr.insertCell();
			let td_tarefaAutomatica = tr.insertCell();			
            let td_descricaoTarefa  = tr.insertCell();
            let td_nomeResponsavel  = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_tituloTarefa.innerText     = ( this.listaTarefas[i].tituloTarefa          !== undefined ? this.listaTarefas[i].tituloTarefa          : '' );
            td_dataTarefa.innerText       = ( this.listaTarefas[i].dataTarefa            !== undefined ? this.listaTarefas[i].dataTarefa            : '' );
            td_duracaoTarefa.innerText    = ( this.listaTarefas[i].duracaoTarefa         !== undefined ? this.listaTarefas[i].duracaoTarefa         : '' );
			td_prioridadefa.innerText     = ( this.listaTarefas[i].prioridade            !== undefined ? this.listaTarefas[i].prioridade            : '' );
			td_indispfa.innerText         = ( this.listaTarefas[i].indisponibilidade     === true      ? 'X'                                        : '' );
			td_enviarEmail.innerText      = ( this.listaTarefas[i].enviarEmail           === true      ? 'X'                                        : '' );
			td_tarefaAutomatica.innerText = ( this.listaTarefas[i].tarefaAutomatica      === true      ? 'X'                                        : '' );
            td_descricaoTarefa.innerText  = ( this.listaTarefas[i].descricaoTarefa       !== undefined ? this.listaTarefas[i].descricaoTarefa       : '' );
            td_nomeResponsavel.innerText  = ( this.listaTarefas[i].nomeResponsavelTarefa !== undefined ? this.listaTarefas[i].nomeResponsavelTarefa : '' );
			///////////////////////////////////////////////////////////////////
			td_tituloTarefa.setAttribute    ( 'style', 'vertical-align: middle' );
			td_dataTarefa.setAttribute      ( 'style', 'vertical-align: middle' );
			td_duracaoTarefa.setAttribute   ( 'style', 'vertical-align: middle' );
			td_prioridadefa.setAttribute    ( 'style', 'vertical-align: middle' );
			td_descricaoTarefa.setAttribute ( 'style', 'vertical-align: middle' );
			td_indispfa.setAttribute        ( 'style', 'vertical-align: middle' );
			td_nomeResponsavel.setAttribute ( 'style', 'vertical-align: middle' );
			td_enviarEmail.setAttribute     ( 'style', 'vertical-align: middle' );
			td_tarefaAutomatica.setAttribute( 'style', 'vertical-align: middle' );
			///////////////////////////////////////////////////////////////////
			td_enviarEmail.classList.add('center');
			td_tarefaAutomatica.classList.add('center');
			td_indispfa.classList.add('center');
			td_prioridadefa.classList.add('center');
		}
	}
	
	montaResumoPlanoComunicacao(){
		let tbody = document.getElementById('TbodyShowClientesAfetados');
		tbody.innerText = '';
		for(let i = 0; i < this.listaClientesAfetados.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            // Crias as celulas
            let td_idClienteAfet = tr.insertCell();
            let td_clienteAfet   = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_idClienteAfet.innerText = ( this.listaClientesAfetados[i].idClienteAfet !== undefined ? this.listaClientesAfetados[i].idClienteAfet : '' );
            td_clienteAfet.innerText   = ( this.listaClientesAfetados[i].clienteAfet   !== undefined ? this.listaClientesAfetados[i].clienteAfet   : '' );
			/////////////////////////////////////////////////////////////////
			td_idClienteAfet.setAttribute('style', 'vertical-align: middle' );
			td_clienteAfet.setAttribute  ('style', 'vertical-align: middle' );
		    /////////////////////////////////////////////////////////////////
		}
		
		let tbody1 = document.getElementById('TbodyShowPlComunicacaoPessoas');
		tbody1.innerText = '';
		for(let i = 0; i < this.listaPlanoComunicacoes.length; i++){
			// Cria as linhas
            let tr = tbody1.insertRow();
            // Crias as celulas
            let td_pcIdContato   = tr.insertCell();
            let td_pcNomeContato = tr.insertCell();
            let td_pcEmpresa     = tr.insertCell();
            let td_pcEmail       = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_pcIdContato.innerText   = ( this.listaPlanoComunicacoes[i].pcIdContato   !== undefined ? this.listaPlanoComunicacoes[i].pcIdContato   : '' );
            td_pcNomeContato.innerText = ( this.listaPlanoComunicacoes[i].pcNomeContato !== undefined ? this.listaPlanoComunicacoes[i].pcNomeContato : '' );
            td_pcEmpresa.innerText     = ( this.listaPlanoComunicacoes[i].pcEmpresa     !== undefined ? this.listaPlanoComunicacoes[i].pcEmpresa     : '' );
            td_pcEmail.innerText       = ( this.listaPlanoComunicacoes[i].pcEmail       !== undefined ? this.listaPlanoComunicacoes[i].pcEmail       : '' );
			///////////////////////////////////////////////////////////////////
			td_pcIdContato.setAttribute  ('style', 'vertical-align: middle' );
			td_pcNomeContato.setAttribute('style', 'vertical-align: middle' );
			td_pcEmpresa.setAttribute    ('style', 'vertical-align: middle' );
			td_pcEmail.setAttribute      ('style', 'vertical-align: middle' );
		}		
	}

	
   	montaAprovadores(){
		let tbody = document.getElementById('TbodyShowAprovadores');
		tbody.innerText = '';
		
		for(let i = 0; i < this.listaAprovadores.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
            let td_idAprovadores  = tr.insertCell();
            let td_nomeAprovador  = tr.insertCell();
            let td_emailAprovador = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_idAprovadores.innerText  = ( this.listaAprovadores[i].idAprovadores  !== undefined ? this.listaAprovadores[i].idAprovadores  : '' );
            td_nomeAprovador.innerText  = ( this.listaAprovadores[i].nomeAprovador  !== undefined ? this.listaAprovadores[i].nomeAprovador  : '' );
            td_emailAprovador.innerText = ( this.listaAprovadores[i].emailAprovador !== undefined ? this.listaAprovadores[i].emailAprovador : '' );
			///////////////////////////////////////////////////////////////////
			td_idAprovadores.setAttribute ('style', 'vertical-align: middle' );
			td_nomeAprovador.setAttribute ('style', 'vertical-align: middle' );
			td_emailAprovador.setAttribute('style', 'vertical-align: middle' );
			///////////////////////////////////////////////////////////////////
		}
	}

   	montaResumoDadosIdentMudancca(){
		let tbody = document.getElementById('TbodyShowDadosIdentMudancca');
		tbody.innerText = '';
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_tituloMudanca            = tr.insertCell();
        let td_login                    = tr.insertCell();
        let td_statusMudanca            = tr.insertCell();
        let td_tipoMudanca              = tr.insertCell();
        let td_impactoMudanca           = tr.insertCell();
        let td_urgenciaMudanca          = tr.insertCell();
        let td_dataExecucao             = tr.insertCell();
        let td_horarioInicio            = tr.insertCell();
        let td_dataPrevistaConclusao    = tr.insertCell();
        let td_HorarioPrevistoConclusao = tr.insertCell();
        let td_descricaoMudanca         = tr.insertCell();
        let td_justificativaMudanca     = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_tituloMudanca.innerText            = ( this.dadosIdentMudanca.tituloMudanca            !== undefined ? this.dadosIdentMudanca.tituloMudanca            : '' );
        td_login.innerText                    = ( this.dadosIdentMudanca.login                    !== undefined ? this.dadosIdentMudanca.login                    : '' );
        td_statusMudanca.innerText            = ( this.dadosIdentMudanca.statusMudanca            !== undefined ? this.dadosIdentMudanca.statusMudanca            : '' );
        td_tipoMudanca.innerText              = ( this.dadosIdentMudanca.tipoMudanca              !== undefined ? this.dadosIdentMudanca.tipoMudanca              : '' );
        td_impactoMudanca.innerText           = ( this.dadosIdentMudanca.impactoMudanca           !== undefined ? this.dadosIdentMudanca.impactoMudanca           : '' );
        td_urgenciaMudanca.innerText          = ( this.dadosIdentMudanca.urgenciaMudanca          !== undefined ? this.dadosIdentMudanca.urgenciaMudanca          : '' );
        td_dataExecucao.innerText             = ( this.dadosIdentMudanca.dataExecucao             !== undefined ? this.dadosIdentMudanca.dataExecucao             : '' );
        td_horarioInicio.innerText            = ( this.dadosIdentMudanca.horarioInicio            !== undefined ? this.dadosIdentMudanca.horarioInicio            : '' );
        td_dataPrevistaConclusao.innerText    = ( this.dadosIdentMudanca.dataPrevistaConclusao    !== undefined ? this.dadosIdentMudanca.dataPrevistaConclusao    : '' );
        td_HorarioPrevistoConclusao.innerText = ( this.dadosIdentMudanca.HorarioPrevistoConclusao !== undefined ? this.dadosIdentMudanca.HorarioPrevistoConclusao : '' );
        td_descricaoMudanca.innerText         = ( this.dadosIdentMudanca.descricaoMudanca         !== undefined ? this.dadosIdentMudanca.descricaoMudanca         : '' );
        td_justificativaMudanca.innerText     = ( this.dadosIdentMudanca.justificativaMudanca     !== undefined ? this.dadosIdentMudanca.justificativaMudanca     : '' );
		/////////////////////////////////////////////////////////////////////////////
		td_tituloMudanca.setAttribute           ('style', 'vertical-align: middle' );
		td_login.setAttribute                   ('style', 'vertical-align: middle' );
		td_statusMudanca.setAttribute           ('style', 'vertical-align: middle' );
		td_tipoMudanca.setAttribute             ('style', 'vertical-align: middle' );
		td_impactoMudanca.setAttribute          ('style', 'vertical-align: middle' );
		td_urgenciaMudanca.setAttribute         ('style', 'vertical-align: middle' );
		td_dataExecucao.setAttribute            ('style', 'vertical-align: middle' );
		td_horarioInicio.setAttribute           ('style', 'vertical-align: middle' );
		td_dataPrevistaConclusao.setAttribute   ('style', 'vertical-align: middle' );
		td_HorarioPrevistoConclusao.setAttribute('style', 'vertical-align: middle' );
		td_descricaoMudanca.setAttribute        ('style', 'vertical-align: middle' );
		td_justificativaMudanca.setAttribute    ('style', 'vertical-align: middle' );
		/////////////////////////////////////////////////////////////////////////////
	}
	
   	montaResumoAcaosPosAtividades(){
		let tbody = document.getElementById('TbodyShowacaosPosAtividades');
		tbody.innerText = '';
        let tr = tbody.insertRow();
        
        // Crias as celulas
        let td_planoTestes  = tr.insertCell();
        let td_planoRetorno = tr.insertCell();

        // Inseri os valores do objeto nas celulas
        td_planoTestes.innerText  = ( this.acaosPosAtividades.planoTestes  !== undefined ? this.acaosPosAtividades.planoTestes  : '' );
        td_planoRetorno.innerText = ( this.acaosPosAtividades.planoRetorno !== undefined ? this.acaosPosAtividades.planoRetorno : '' );
		/////////////////////////////////////////////////////////////////
		td_planoTestes.setAttribute ('style', 'vertical-align: middle' );
		td_planoRetorno.setAttribute('style', 'vertical-align: middle' );
	    /////////////////////////////////////////////////////////////////
	}

	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	
	getDadosApi(){
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_Aprovadores = [];
		for(let i = 0; i < this.listaAprovadores.length; i++){
		    let l_Aprovadores = {
				aprovadores: {idAprovadores: this.listaAprovadores[i].idAprovadores,
				                  aprovador: this.listaAprovadores[i].nomeAprovador,
				                      email: this.listaAprovadores[i].emailAprovador}, 
				statusAprovacao: 'false'
			};
		    list_Aprovadores.push(l_Aprovadores);
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_ClientesAfetados = [];
		for(let i = 0; i < this.listaClientesAfetados.length; i++){
		    let l_ClientesAfetados = { clientesAfetados: {id_clientes_af: this.listaClientesAfetados[i].idClienteAfet,
		                                                    nome_cliente: this.listaClientesAfetados[i].clienteAfet }
		                             };
            list_ClientesAfetados.push(l_ClientesAfetados);
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_PlanoComunicacoes = [];
		for(let i = 0; i < this.listaPlanoComunicacoes.length; i++){
		    let l_PlanoComunicacoes = { nome_contato: this.listaPlanoComunicacoes[i].pcNomeContato,
		                                empresa     : this.listaPlanoComunicacoes[i].pcEmpresa    ,
		                                email       : this.listaPlanoComunicacoes[i].pcEmail
		                              };
            list_PlanoComunicacoes.push(l_PlanoComunicacoes);
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_Tarefas = [];
		for(let i = 0; i < this.listaTarefas.length; i++){
			let l_Tarefas = {
	            titulo_atividade_mudanca: this.listaTarefas[i].tituloTarefa                                  ,
				atividade_mudanca       : this.listaTarefas[i].descricaoTarefa                               ,
	            dt_tarefa               : this.FormataStringData( this.listaTarefas[i].dataTarefa )          ,
	            duracao                 : this.listaTarefas[i].duracaoTarefa                                 ,
				prioridade              : this.listaTarefas[i].prioridade                                    ,
				enviar_email            : this.listaTarefas[i].enviarEmail                                   ,
				tarefa_automatica       : this.listaTarefas[i].tarefaAutomatica                              ,
				indisponibilidade       : this.listaTarefas[i].indisponibilidade                             ,
	            responsavelAtividade    :{id_responsavel_atividade:this.listaTarefas[i].idResponsavelTarefa },
	            statusAtividade         :{id_status_atividade     :'2'}
			};
			list_Tarefas.push(l_Tarefas);
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_ArquivosMudanca = [];
		for(let i = 0; i < this.listaArquivosMudanca.length; i++){
			let l_ArquivosMudanca = {
	            nome_arq      : this.listaArquivosMudanca[i].nomeArquivo    ,
				titulo_arquivo: this.listaArquivosMudanca[i].tituloArquivo  ,
	            arquivo       : this.listaArquivosMudanca[i].ArquivotoBase64,
	            tipo_Arq      : this.listaArquivosMudanca[i].extensaoArq
			};
			list_ArquivosMudanca.push(l_ArquivosMudanca);
		}
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_ArquivosMudancaAprovCliente = [];
		for(let i = 0; i < this.listaArquivosMudancaAprovCliente.length; i++){
			let l_ArquivosMudancaAprovCliente = {
	            nome_arq      : this.listaArquivosMudancaAprovCliente[i].nomeArqAprovCliente        ,
				titulo_arquivo: this.listaArquivosMudancaAprovCliente[i].tituloArqAprovCliente      ,
	            arquivo       : this.listaArquivosMudancaAprovCliente[i].ArquivotoBase64AprovCliente,
	            tipo_Arq      : this.listaArquivosMudancaAprovCliente[i].extensaoArqAprovCliente
			};
			list_ArquivosMudancaAprovCliente.push(l_ArquivosMudancaAprovCliente);
		}

		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let dadostMudanca = {
		    titulo_mudanca        : this.dadosIdentMudanca.tituloMudanca                                   ,
 	   	    login_user            : this.dadosIdentMudanca.login                                           ,
 	   	    email_solicitante     : this.dadosIdentMudanca.emailSolicitante                                ,
 	   	    criticidade           : {id_criticidade: this.dadosIdentMudanca.idUrgenciaMudanca   ,
 	   	                                criticidade:this.dadosIdentMudanca.urgenciaMudanca      }          ,
 	   	    impactoMudanca        : {id_impacto_mudanca: this.dadosIdentMudanca.idImpactoMudanca,
 	   	                                impacto_mudanca: this.dadosIdentMudanca.impactoMudanca  }          ,
 	   	    tipoMudanca           : {id_tipo_mudanca: this.dadosIdentMudanca.idTipoMudanca      ,
 	   	                                tipo_mudanca:this.dadosIdentMudanca.tipoMudanca         }          ,
 	   	    dadosMudanca          : {dt_inicio            : this.FormataStringData( this.dadosIdentMudanca.dataExecucao )         ,
 	   	                             hr_inicio            : this.dadosIdentMudanca.horarioInicio           ,
 	   	                             dt_final             : this.FormataStringData( this.dadosIdentMudanca.dataPrevistaConclusao ),
 	   	                             hr_final             : this.dadosIdentMudanca.HorarioPrevistoConclusao,
 	   	                             dsc_mudanca          : this.dadosIdentMudanca.descricaoMudanca        ,
 	   	                             justificativa_mudanca: this.dadosIdentMudanca.justificativaMudanca
 	   	                           }                                                                       ,
 	   	   arqAprovacaoCliente    : list_ArquivosMudancaAprovCliente                                       ,
 	   	   listaAprovadores       : list_Aprovadores                                                       ,
 	   	   mudancaClientesAfetados: list_ClientesAfetados                                                  ,
 	   	   planoComunicacoes      : list_PlanoComunicacoes                                                 ,
 	   	   atividadesMudanca      : list_Tarefas                                                           ,
 	   	   arquivosMudanca        : list_ArquivosMudanca                                                   ,
 	   	   acaoPosAtividade       : {plano_teste   : this.acaosPosAtividades.planoTestes                   , 
 	   	                             plano_rollback: this.acaosPosAtividades.planoRetorno
 	   	                          }                
 	   	};  

 	   	return dadostMudanca;     

	}

    salvarGMUDEmergencial(){
	    let dados = this.getDadosApi();
//	console.log(  JSON.stringify( dados ) );
        let urlBase    = document.getElementById   ('urlAPI').value;
        let urlBaseSME = urlBase + 'salvarMudancaEmergencia';
		this.showLoading();
		
		let caminhoUrlPricipal = this.getContextPath() + "/principal/telaPrincipal.jsp";
		
		$.ajax({
			method : "POST",
//			url    : "http://localhost:8090/PortalMudanca/salvarMudancaEmergencia",
			url    : urlBaseSME,
			data   : JSON.stringify(dados),
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				 $("#box_dark").css('display','none');
				 document.getElementById("btSalvarGMUDNormal").disabled = true;
				 Swal.fire({
				   title: "Cadastro GMUD",
				   text : "GMUD Emergencial( "+ response.titulo_mudanca +" )cadastrada com sucesso!",
				   icon : "success",
				   showCancelButton: false,
				   confirmButtonColor: "#3085d6",
				   cancelButtonColor: "#d33",
				   confirmButtonText: "OK"
				 }).then((result) => {
				   if (result.isConfirmed) {
				       window.location = caminhoUrlPricipal;
				   }
				 });				 
			}
		}).fail(function(xhr) {
			 $("#box_dark").css('display','none');
			if (xhr.status == 500){
	            var answer = xhr.responseText; //adiciona o que foi carregado a uma variável
			    var patients = JSON.parse(answer); //converte o que foi carregado para um objeto javascript
//				alert(  patients.status + ' - '+ patients.message + ' - '+ patients.path + ' - '+ patients.error )
				let msnErro = 'Codego Erro: ' + patients.status + ' / Mensagem erro: ' + patients.message;
				Swal.fire({
							icon  : "error"        ,
							title : patients.error ,
							text  : msnErro        ,
						  });
			}else{
			   Swal.fire({
			       icon  : "error"                             ,
			       title : "Salvar GMUD"                       ,
			       text  : "Erro ao salvar GMUD: " + xhr.responseText ,
			       }
			   );
			}

			document.getElementById("btSalvarGMUDNormal").disabled = false;
		});
	}
	 
	showLoading(){
	   $("#box_dark").css('display','flex');
	}

	hideLoading(){
	   $("#box_dark").css('display','none');
	}
 
	
	getContextPath() {
       return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    }
    
    MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {  
// icon
//  	"warning"
//  	"error"
//  	"success"
//  	"info"

	  Swal.fire({
		    icon  : iconi                             ,
		    title : tituloPrincipal                   ,
		    text  : textoPrincipal                    ,
		    target: document.getElementById(nomeModal),
		    }
		);
	
   }
   
   MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
// icon
//	  	"warning"
//	  	"error"
//	  	"success"
//	  	"info"

		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    }
			);
		
   }
   FormataStringData(data) {
       var dia  = data.split("/")[0];
       var mes  = data.split("/")[1];
       var ano  = data.split("/")[2];

      return ano + '-' + ("0"+mes).slice(-2) + '-' + ("0"+dia).slice(-2);
     // Utilizo o .slice(-2) para garantir o formato com 2 digitos.
     
   }	
}


var mudancaEmergencial = new MudancaEmergencial() 