/**
 * Class de Cadastro de Mudanca Padrao
 */
class MudancaPadrao{
	
	constructor(){
		// Informacoes do corpo da GMUD
		this.dadosIdentMudanca      = {}; 
		// Informacoes dos Clientes que serao Afetados na GMUD
		this.idCliAfetados          = 1;
		this.listaClientesAfetados  = []
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
	validacaoClientesAfetados(){
		if(this.listaClientesAfetados.length < 1 ) return true;
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
	/*************************************/
	/*                                   */
	/*************************************/
	
	// Chama a API para salvar a Mudança Padrao na base de Dados.
	salvarMudancaPadrao(){
		this.adicionarMudancaPadrao();
	}
	
	// Adiciona as informacoes da tela no Objeto
	adicionarMudancaPadrao(){
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
        dadosIdentificacaoMudanca.idTipoMudanca            = "3"                                                           ;
        dadosIdentificacaoMudanca.tipoMudanca              = 'Padrão'                                                      ;
        dadosIdentificacaoMudanca.idImpactoMudanca         = document.getElementById   ( "impactoMudanca"           ).value;
        dadosIdentificacaoMudanca.impactoMudanca           = $('#impactoMudanca').find ( ":selected").text( )              ;
        dadosIdentificacaoMudanca.idUrgenciaMudanca        = document.getElementById   ( "urgenciaMudanca"          ).value;
        dadosIdentificacaoMudanca.urgenciaMudanca          = $('#urgenciaMudanca').find( ":selected").text( )              ;        
        dadosIdentificacaoMudanca.idCategoriaPadrao        = document.getElementById   ( "categoriaPadrao"          ).value;
        dadosIdentificacaoMudanca.categoriaPadrao          = $('#categoriaPadrao').find( ":selected").text( )              ;
        
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
		clientesAfetado.idClienteAfet = document.getElementById( 'idClienteAfetado'  ).value;
		clientesAfetado.clienteAfet   = document.getElementById( 'nomeClienteAfetado').value;
		clientesAfetado.alias         = document.getElementById( 'nomeClienteAlias'  ).value;
		clientesAfetado.nomeGrupo     = 'Insert Manual';
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
		   this.MensagemConfimacao( "warning", "validação ClientesA fetado", msg ); 
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
			let td_aliasShow         = tr.insertCell();
			let td_nomeGrupoShow     = tr.insertCell();
	        let td_delete            = tr.insertCell();
	        
	         // Inseri os valores do objeto nas celulas
	        td_idClienteAfetShow.innerText = ( listaClientesAfetados[i].idClienteAfet !== undefined ? listaClientesAfetados[i].idClienteAfet : ' - ' );
	        td_clienteAfetShow.innerText   = ( listaClientesAfetados[i].clienteAfet   !== undefined ? listaClientesAfetados[i].clienteAfet   : ' - ' );
			td_aliasShow.innerText         = ( listaClientesAfetados[i].alias         !== undefined ? listaClientesAfetados[i].alias         : ' - ' );
			td_nomeGrupoShow.innerText     = ( listaClientesAfetados[i].nomeGrupo     !== undefined ? listaClientesAfetados[i].nomeGrupo     : ' - ' );
			/////////////////////////////////////////////////////////////////
			td_idClienteAfetShow.setAttribute('style', 'vertical-align: middle' );
			td_clienteAfetShow.setAttribute  ('style', 'vertical-align: middle' );
			td_aliasShow.setAttribute        ('style', 'vertical-align: middle' );
			td_nomeGrupoShow.setAttribute    ('style', 'vertical-align: middle' );
			td_delete.setAttribute           ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////
	        
	        let imgDelete = document.createElement('img');
			imgDelete.setAttribute('style', 'cursor:pointer;' );
	        imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
	        imgDelete.setAttribute('onclick','mudancaPadrao.deleteClientesAfetado( ' +  listaClientesAfetados[i].idCliAfetados + ' )');
	        td_delete.appendChild(imgDelete);
	        
			td_delete.setAttribute('style', 'text-align: center; vertical-align: middle;' );
			td_idClienteAfetShow.setAttribute('style', 'text-align: center; vertical-align: middle;' );
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
		$('#selectclienteAlias'    ).get(0).selectedIndex = 0;
		$('#grupoCliente'          ).get(0).selectedIndex = 0;
		$("#idClienteAfetado"      ).val("");
		$("#nomeClienteAfetado"    ).val("");
		$("#nomeClienteAlias"      ).val("");
		
		
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
	limparListaTarefas(){
		this.idTarefa               = 1;
		this.listaTarefas           = [];		
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	salvarTarefa( listaTarefas, idRespAtividade, respAtividade, emailRespAatividade ){
		
		for(let i = 0; i < listaTarefas.length; i++){
		    let tarefa = this.lerDadosTarefa( listaTarefas[i], idRespAtividade, respAtividade, emailRespAatividade );
		    this.adicionarTarefa(tarefa);
		    this.listaTabelaTarefa( this.listaTarefas );
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
	lerDadosTarefa( listaTarefas, idRespAtividade, respAtividade, emailRespAatividade ){
		let tarefa = {};
		tarefa.idTarefa               = this.idTarefa;
		tarefa.idResponsavelTarefa    = idRespAtividade;
		tarefa.nomeResponsavelTarefa  = respAtividade;
		tarefa.emailResponsavelTarefa = emailRespAatividade;
		
		tarefa.tituloTarefa           = listaTarefas.tituloCatPadrao;
		tarefa.dataTarefa             = document.getElementById( 'dataExecucao'  ).value;
		tarefa.prioridade             = listaTarefas.prioridade;
		tarefa.duracaoTarefa          = listaTarefas.duracao;
		tarefa.descricaoTarefa        = listaTarefas.descCatPadrao;
		tarefa.enviarEmail            = checkBoxEmail.checked;
		return tarefa;
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
			let td_enviarEmailTarefaShow     = tr.insertCell();
			let td_descricaoTarefaShow       = tr.insertCell();
			let td_nomeResponsavelTarefaShow = tr.insertCell();

             // Inseri os valores do objeto nas celulas
            td_tituloTarefaShow.innerText          = ( tarefas[i].tituloTarefa          !== undefined ? tarefas[i].tituloTarefa          : '' );
            td_dataTarefaShow.innerText            = ( tarefas[i].dataTarefa            !== undefined ? tarefas[i].dataTarefa            : '' );
            td_duracaoTarefaShow.innerText         = ( tarefas[i].duracaoTarefa         !== undefined ? tarefas[i].duracaoTarefa         : '' );
			td_prioridadefa.innerText              = ( tarefas[i].prioridade            !== undefined ? tarefas[i].prioridade            : '' );
			td_enviarEmailTarefaShow.innerText     = ( tarefas[i].emailResponsavelTarefa!== undefined ? tarefas[i].emailResponsavelTarefa: '' );
            td_descricaoTarefaShow.innerText       = ( tarefas[i].descricaoTarefa       !== undefined ? tarefas[i].descricaoTarefa       : '' );
            td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].nomeResponsavelTarefa !== undefined ? tarefas[i].nomeResponsavelTarefa : '' );
			/////////////////////////////////////////////////////////////////
			td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
			td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
			td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
			td_prioridadefa.setAttribute             ('style', 'vertical-align: middle' );
			td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
			td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle' );
			td_enviarEmailTarefaShow.setAttribute    ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////

			td_duracaoTarefaShow.classList.add('center');
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
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Arquivo", msg ); 
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
			/////////////////////////////////////////////////////////////////
			td_tituloArquivoShow.setAttribute ('style', 'vertical-align: middle' );
			td_nomeArquivoShow.setAttribute   ('style', 'vertical-align: middle' );
			td_caminhoArquivoShow.setAttribute('style', 'vertical-align: middle' );
			td_extensaoArqShow.setAttribute   ('style', 'vertical-align: middle' );
			td_delete.setAttribute            ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////
            
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
			imgDelete.setAttribute('style', 'cursor:pointer;' );
            imgDelete.setAttribute('onclick','mudancaPadrao.deleteArquivo( ' +  listaArquivo[i].idArqsMudanca + ' )');
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
		this.montaResumoTarefas();
		this.montaResumoArquivosAnexados();
		this.montaResumoPlanoComunicacao();
//		let v_listProduto   = JSON.stringify(this.listProduto  );
//		$("#conteudoProduto").val( v_listProduto);
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
            let td_tituloTarefa    = tr.insertCell();
            let td_dataTarefa      = tr.insertCell();
            let td_duracaoTarefa   = tr.insertCell();
			let td_prioridadefa    = tr.insertCell();
			let td_enviarEmail     = tr.insertCell();
            let td_descricaoTarefa = tr.insertCell();
            let td_nomeResponsavel = tr.insertCell();

            // Inseri os valores do objeto nas celulas
            td_tituloTarefa.innerText    = ( this.listaTarefas[i].tituloTarefa          !== undefined ? this.listaTarefas[i].tituloTarefa          : '' );
            td_dataTarefa.innerText      = ( this.listaTarefas[i].dataTarefa            !== undefined ? this.listaTarefas[i].dataTarefa            : '' );
            td_duracaoTarefa.innerText   = ( this.listaTarefas[i].duracaoTarefa         !== undefined ? this.listaTarefas[i].duracaoTarefa         : '' );
			td_prioridadefa.innerText    = ( this.listaTarefas[i].prioridade            !== undefined ? this.listaTarefas[i].prioridade            : '' );
			td_enviarEmail.innerText     = ( this.listaTarefas[i].emailResponsavelTarefa!== undefined ? this.listaTarefas[i].emailResponsavelTarefa: '' );
            td_descricaoTarefa.innerText = ( this.listaTarefas[i].descricaoTarefa       !== undefined ? this.listaTarefas[i].descricaoTarefa       : '' );
            td_nomeResponsavel.innerText = ( this.listaTarefas[i].nomeResponsavelTarefa !== undefined ? this.listaTarefas[i].nomeResponsavelTarefa : '' );
			/////////////////////////////////////////////////////////////////
			td_tituloTarefa.setAttribute   ('style', 'vertical-align: middle' );
			td_dataTarefa.setAttribute     ('style', 'vertical-align: middle' );
			td_duracaoTarefa.setAttribute  ('style', 'vertical-align: middle' );
			td_prioridadefa.setAttribute    ( 'style', 'vertical-align: middle' );
			td_descricaoTarefa.setAttribute('style', 'vertical-align: middle' );
			td_nomeResponsavel.setAttribute('style', 'vertical-align: middle' );
			td_enviarEmail.setAttribute    ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////
			td_duracaoTarefa.classList.add('center');
			td_prioridadefa.classList.add('center');
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
		/////////////////////////////////////////////////////////////////
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
		/////////////////////////////////////////////////////////////////
	}
	
	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	convertHoraMinutos(minutos){
		
		  const horas = Math.floor(minutos/ 60);          
		  const min = minutos % 60;
		  const textoHoras = (`00${horas}`).slice(-2);
		  const textoMinutos = (`00${min}`).slice(-2);
		  
		  return `${textoHoras }:${textoMinutos}`;
	}
	
	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/	
	getDadosApi(){
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
		let list_Tarefas = [];
		for(let i = 0; i < this.listaTarefas.length; i++){
			let l_Tarefas = {
	            titulo_atividade_mudanca: this.listaTarefas[i].tituloTarefa                                  ,
				atividade_mudanca       : this.listaTarefas[i].descricaoTarefa                               ,
	            dt_tarefa               : this.FormataStringData( this.listaTarefas[i].dataTarefa )          ,
//	            duracao                 : this.listaTarefas[i].duracaoTarefa                                 ,
				duracao                 : this.convertHoraMinutos( this.listaTarefas[i].duracaoTarefa )      ,
				prioridade              : this.listaTarefas[i].prioridade                                    ,
				enviar_email            : this.listaTarefas[i].enviarEmail                                   ,
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
//	            arquivo       : 'TESTE',
	            tipo_Arq      : this.listaArquivosMudanca[i].extensaoArq
			};
			list_ArquivosMudanca.push(l_ArquivosMudanca);
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
 	   	    categoriaPadrao        : {id_categoria_padrao: this.dadosIdentMudanca.idCategoriaPadrao,
 	   	                                 categoria_padrao:this.dadosIdentMudanca.categoriaPadrao}           ,
 	   	    mudancaClientesAfetados: list_ClientesAfetados                                                  ,
 	   	    arquivosMudanca        : list_ArquivosMudanca                                                   ,
 	   	    atividadesMudanca      : list_Tarefas                                                           ,
 	   	    dadosMudanca           : {dt_inicio            : this.FormataStringData( this.dadosIdentMudanca.dataExecucao )         ,
 	   	                              hr_inicio            : this.dadosIdentMudanca.horarioInicio                                  ,
 	   	                              dt_final             : this.FormataStringData( this.dadosIdentMudanca.dataPrevistaConclusao ),
 	   	                              hr_final             : this.dadosIdentMudanca.HorarioPrevistoConclusao                       ,
 	   	                              dsc_mudanca          : this.dadosIdentMudanca.descricaoMudanca                               ,
 	   	                              justificativa_mudanca: this.dadosIdentMudanca.justificativaMudanca
 	   	                             }                                                                       ,
 	   	    acaoPosAtividade        : {plano_teste: '', plano_rollback:''}                
 	   	};  


 	   	return dadostMudanca;     

	}

    salvarGMUDPadrao(){
		this.showLoading();	
		let dados              = this.getDadosApi();
    	let urlBase            = document.getElementById('urlAPI').value;
    	let urlAPI             = urlBase + 'salvarMudancaPadrao';
		let caminhoUrlPricipal = this.getContextPath() + "/principal/telaPrincipal.jsp";
		$.ajax({
			method      : "POST"                           ,
			url         : urlAPI                           ,
			data        : JSON.stringify( dados )          ,
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				 $("#box_dark").css('display','none');
				 document.getElementById("btSalvarGMUDNormal").disabled = true;
				 
				 Swal.fire({
				   title             : "Cadastro GMUD",
				   text              : "GMUD Padrao( "+ response.titulo_mudanca +" )cadastrada com sucesso!",
				   icon              : "success",
				   showCancelButton  : false    ,
				   confirmButtonColor: "#3085d6",
				   cancelButtonColor : "#d33"   ,
				   confirmButtonText : "OK"
				 }).then((result) => {
				   if (result.isConfirmed) {
				       window.location = caminhoUrlPricipal;
				   }
				 });				 
			}
		}).fail(function(xhr) {
			 $("#box_dark").css('display','none');
			if (xhr.status == 500){
	            var answer   = xhr.responseText; //adiciona o que foi carregado a uma variável
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
	
	upResponsavelAtivade( idSelect , index ){
		let idResponsavel   = document.getElementById(idSelect).value;
		let nomeResponsavel = $('#'+idSelect).find ( ":selected").text();
		
		this.listaTarefas[index].idResponsavelTarefa   = idResponsavel;
		this.listaTarefas[index].nomeResponsavelTarefa = nomeResponsavel;
	}
		
	/******************************************************************/
	async getResponsavelTarefa(){
	     let urlBase = document.getElementById('urlAPI').value;
	     let urlAPI  = urlBase + 'listaResponsavelAtividade';

	     const l_ResponsavelCliente = await fetch(urlAPI).then(response => response.json());
	//     console.log( l_ResponsavelCliente );
	     return l_ResponsavelCliente;
	}
	 
    async listaTabelaTarefaOpcaoEscolaResponsavel( tarefas ){
 		let tbody = document.getElementById('tbTarefas');
 		tbody.innerText = '';
 				
 		let l_r_Cliente = await this.getResponsavelTarefa();
 //		console.log( l_r_Cliente );
 		
 		for(let i = 0; i < tarefas.length; i++){
 			
 			let tr = tbody.insertRow();
 			
 			let selected    = "";			 
 	        var idSelect    = "id_select_" + i;
 	        let valorSelect = "";
				        	        
            valorSelect = " <select style=\"text-align: center; vertical-align: middle\" class=\"form-control\" id=\"" + idSelect + "\" onchange=\"mudancaPadrao.upResponsavelAtivade('" + idSelect + "', "  + i + " )\">";
            for(let j = 0; j < l_r_Cliente.length; j++){
                if( parseInt(tarefas[i].idResponsavelTarefa) === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
                else selected = "";	
                valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
            }
            valorSelect += " </select>";	

			let td_tituloTarefaShow          = tr.insertCell();
			let td_dataTarefaShow            = tr.insertCell();
			let td_duracaoTarefaShow         = tr.insertCell();
			let td_prioridadefa              = tr.insertCell(); 
			let td_enviarEmailTarefaShow     = tr.insertCell();
			let td_descricaoTarefaShow       = tr.insertCell();
			let td_nomeResponsavelTarefaShow = tr.insertCell();

             // Inseri os valores do objeto nas celulas
             td_tituloTarefaShow.innerText          = ( tarefas[i].tituloTarefa           !== undefined ? tarefas[i].tituloTarefa           : '' );
             td_dataTarefaShow.innerText            = ( tarefas[i].dataTarefa             !== undefined ? tarefas[i].dataTarefa             : '' );
             td_duracaoTarefaShow.innerText         = ( tarefas[i].duracaoTarefa          !== undefined ? tarefas[i].duracaoTarefa          : '' );
             td_prioridadefa.innerText              = ( tarefas[i].prioridade             !== undefined ? tarefas[i].prioridade             : '' );
			 td_enviarEmailTarefaShow.innerText     = ( tarefas[i].emailResponsavelTarefa !== undefined ? tarefas[i].emailResponsavelTarefa : '' );
             td_descricaoTarefaShow.innerText       = ( tarefas[i].descricaoTarefa        !== undefined ? tarefas[i].descricaoTarefa        : '' );	             
             td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.
             	             
             td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
             td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
             td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle; text-align:center' );
             td_prioridadefa.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
             td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
             td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle' );

         }
 	}

	showLoading(){ $("#box_dark").css('display','flex'); }
	hideLoading(){ $("#box_dark").css('display','none'); }	 
    getContextPath() { return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2)); }
    
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


var mudancaPadrao = new MudancaPadrao() 