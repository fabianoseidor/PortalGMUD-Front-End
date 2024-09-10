/**
 * Class de Cadastro de Mudanca Padrao
 */
class CategoriaPadrao{
	
	constructor(){
		// Informacoes da Categoria Padrao
		this.dadosCatPadrao      = {}; 
		// Informacoes dos Itens que conterao na Categoria Padrao
		this.idItemCatPadrao          = 1;
		this.listaItemCatPadrao  = []
	}
	
	/*************************************/
	/* funcoes de validadoes para osStep */
	/*************************************/
	validacaoItemCatPadrao(){
		if(this.listaItemCatPadrao.length < 1 ) return true;
		return false;
	}
	/*************************************/
	/*                                   */
	/*************************************/
	
	// Chama a API para salvar a Mudança Padrao na base de Dados.
	salvarCategoriaPadrao(){
		this.adicionarCategoriaPadrao();
	}
	
	// Adiciona as informacoes da tela no Objeto
	adicionarCategoriaPadrao(){
		this.dadosCatPadrao = this.lerDadosCategoriaPadrao();
	}
	
	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerDadosCategoriaPadrao(){
		let dadosCategoriaPadrao = {};
		/* Dados de Identificação da Mudança */
        dadosCategoriaPadrao.categoria_padrao    = document.getElementById   ( 'categoriaPadrao'     ).value;
		dadosCategoriaPadrao.tipoCategoriaPadrao = document.getElementById   ( 'tipoCategoriaPadrao' ).value;
        dadosCategoriaPadrao.obs                 = document.getElementById   ( 'Obs'                 ).value;
		dadosCategoriaPadrao.login_user          = document.getElementById   ( 'login'               ).value;    

        return dadosCategoriaPadrao;
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
	salvarItemCatPadrao(){
		let itemCatPadrao = this.lerDadosItemCatPadrao();
		
		if( itemCatPadrao != 'NAO' && this.validaItemCatPadrao(itemCatPadrao) ){
			this.adicionarItemCatPadrao(itemCatPadrao);
			this.listaTabelaItemCatPadrao( this.listaItemCatPadrao );
			this.LimparTelaItemCatPadrao();
		}
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarItemCatPadrao(itemCatPadrao){
		this.listaItemCatPadrao.push(itemCatPadrao);
        this.idItemCatPadrao++;
 
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerDadosItemCatPadrao(){
		let itemCatPadrao = {};
		let minutosHora = document.getElementById   ( 'duracao' ).value;
		if( this.validaDuracaoItemCatPadrao(minutosHora) ){		
			itemCatPadrao.idItemCatPadrao   = this.idItemCatPadrao;
			itemCatPadrao.tituloCatPadrao   = document.getElementById   ( 'tituloCatPadrao' ).value;
			itemCatPadrao.descCatPadrao     = document.getElementById   ( 'descCatPadrao'   ).value;
	//		itemCatPadrao.duracao           = document.getElementById   ( 'duracao'         ).value;
			itemCatPadrao.prioridade        = document.getElementById   ( 'prioridade'      ).value;
			itemCatPadrao.indisponibilidade = checkBoxIndisp.checked;
			
			itemCatPadrao.duracao         = this.parseHoraMinutos( minutosHora );
			return itemCatPadrao;
		}
		return 'NAO';
	}
	
	parseHoraMinutos(horario) {
	    let [hora, minuto] = horario.split(':').map(v => parseInt(v));
	    if (!minuto) { // para o caso de não ter os minutos
	        minuto = 0;
	    }
	    return minuto + (hora * 60);
	}

	validaDuracaoItemCatPadrao(minutosHora){
		let msg = null;
		if(minutosHora.trim() == ''){
		   msg = 'Favor informar a "Duração" da tarefa padrão!';
		}

		if(msg != null){
		  // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Criação Tarefa Mudança Padrão", msg ); 
		   return false;
		}

		 return true;
		
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaItemCatPadrao(itemCatPadrao){
		let msg = null;
		if(itemCatPadrao.tituloCatPadrao == ''){
		   msg = 'Favor informar o "Título" da tarefa padão!';
		}

		if(itemCatPadrao.descCatPadrao == ''){
		   msg = 'Favor informar a "Descrição" da tarefa padrão!';
		}
				
		if(itemCatPadrao.duracao == ''){
		   msg = 'Favor informar a "Duração" da tarefa padrão!';
		}
		
		if(itemCatPadrao.prioridade == ''){
		   msg = 'Favor informar a "Prioridade" da tarefa padrão!';
		}
        
        if(msg != null){
		  // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Criação Tarefa Mudança Padrão", msg ); 
           return false;
        }
		
		 return true;
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaItemCatPadrao( listaItemCatPadrao ){ 
		let tbody = document.getElementById('tbItemCatPadrao');
		tbody.innerText = '';
				
		for(let i = 0; i < listaItemCatPadrao.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_tituloCatPadraoShow = tr.insertCell();
			let td_duracaoShow         = tr.insertCell();
			let td_prioridadeShow      = tr.insertCell();
			let td_indispfaShow        = tr.insertCell();
			let td_descCatPadraoShow   = tr.insertCell();
	        let td_delete              = tr.insertCell();
	        
             // Inseri os valores do objeto nas celulas
            td_tituloCatPadraoShow.innerText = ( listaItemCatPadrao[i].tituloCatPadrao   !== undefined ? listaItemCatPadrao[i].tituloCatPadrao : '' );
			td_duracaoShow.innerText         = ( listaItemCatPadrao[i].duracao           !== undefined ? listaItemCatPadrao[i].duracao         : '' );
			td_prioridadeShow.innerText      = ( listaItemCatPadrao[i].prioridade        !== undefined ? listaItemCatPadrao[i].prioridade      : '' );
			td_indispfaShow.innerText        = ( listaItemCatPadrao[i].indisponibilidade === true     ? 'X'                                    : '' );
			td_descCatPadraoShow.innerText   = ( listaItemCatPadrao[i].descCatPadrao     !== undefined ? listaItemCatPadrao[i].descCatPadrao   : '' );
			/////////////////////////////////////////////////////////////////
			td_tituloCatPadraoShow.setAttribute('style', 'vertical-align: middle' );
			td_duracaoShow.setAttribute        ('style', 'vertical-align: middle' );
			td_prioridadeShow.setAttribute     ('style', 'vertical-align: middle' );
			td_descCatPadraoShow.setAttribute  ('style', 'vertical-align: middle' );
			td_indispfaShow.setAttribute       ('style', 'vertical-align: middle; text-align:center' );
			td_delete.setAttribute             ('style', 'vertical-align: middle' );
			/////////////////////////////////////////////////////////////////
            
            let imgDelete = document.createElement('img');
            imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
            imgDelete.setAttribute('onclick','categoriaPadraoClass.deleteItemCatPadrao( ' +  listaItemCatPadrao[i].idItemCatPadrao + ' )');
            td_delete.appendChild(imgDelete);
            
            td_duracaoShow.classList.add('center');
			td_prioridadeShow.classList.add('center');
			td_delete.classList.add('center');			
        }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
    deleteItemCatPadrao ( id ){
		
	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Item da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbItemCatPadrao');
			  for(let i = 0; i < this.listaItemCatPadrao.length; i++){
				  if( this.listaItemCatPadrao[i].idItemCatPadrao === id ){
					  this.listaItemCatPadrao.splice(i, 1);
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
	LimparTelaItemCatPadrao() {
		$("#tituloCatPadrao").val("");
		$("#duracao"        ).val("");
		$("#prioridade"     ).val("");
		$("#descCatPadrao"  ).val("");
		checkBoxIndisp.checked = false;		
    }
 	
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    mostraResumoTela(){
		this.montaCategoriaPadrao();
		this.montaItemCatPadrao();
	}

	montaCategoriaPadrao(){
		let tbody = document.getElementById('TbodyShowCategoriaPadrao');
		tbody.innerText = '';
		let tr = tbody.insertRow();

		// Crias as celulas
		let td_categoriaPadrao = tr.insertCell();
		let td_login_user      = tr.insertCell();
		let td_obs             = tr.insertCell();

		// Inseri os valores do objeto nas celulas
		td_categoriaPadrao.innerText  = ( this.dadosCatPadrao.categoria_padrao !== undefined ? this.dadosCatPadrao.categoria_padrao : '' );
		td_login_user.innerText       = ( this.dadosCatPadrao.login_user       !== undefined ? this.dadosCatPadrao.login_user : '' );
		td_obs.innerText              = ( this.dadosCatPadrao.obs              !== undefined ? this.dadosCatPadrao.obs              : '' );						
		/////////////////////////////////////////////////////////////////
		td_categoriaPadrao.setAttribute('style', 'vertical-align: middle' );
		td_obs.setAttribute            ('style', 'vertical-align: middle' );
	}

   	montaItemCatPadrao(){
		let tbody = document.getElementById('TbodyShowItemCatPadrao');
		tbody.innerText = '';
		for(let i = 0; i < this.listaItemCatPadrao.length; i++){
			// Cria as linhas
            let tr = tbody.insertRow();
            
            // Crias as celulas
			
			let td_tituloCatPadraoShow = tr.insertCell();
			let td_descCatPadraoShow   = tr.insertCell();
			let td_duracaoShow         = tr.insertCell();
			let td_prioridadeShow      = tr.insertCell();
			let td_indispfaShow        = tr.insertCell();
			
			 // Inseri os valores do objeto nas celulas
			td_tituloCatPadraoShow.innerText = ( this.listaItemCatPadrao[i].tituloCatPadrao     !== undefined ? this.listaItemCatPadrao[i].tituloCatPadrao : '' );
			td_descCatPadraoShow.innerText   = ( this.listaItemCatPadrao[i].descCatPadrao       !== undefined ? this.listaItemCatPadrao[i].descCatPadrao   : '' );
			td_duracaoShow.innerText         = ( this.listaItemCatPadrao[i].duracao             !== undefined ? this.listaItemCatPadrao[i].duracao         : '' );
			td_prioridadeShow.innerText      = ( this.listaItemCatPadrao[i].prioridade          !== undefined ? this.listaItemCatPadrao[i].prioridade      : '' );
			td_indispfaShow.innerText        = ( this.listaItemCatPadrao[i].indisponibilidade   === true      ? 'X'                                        : '' ); 			
			/////////////////////////////////////////////////////////////////
			td_duracaoShow.classList.add('center');
			td_indispfaShow.classList.add('center');
			td_prioridadeShow.classList.add('center');
			/////////////////////////////////////////////////////////////////
		}
	}
	

	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	
	getDadosApi(){
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_ItemCatPadrao = [];
		for(let i = 0; i < this.listaItemCatPadrao.length; i++){
		    let l_ItemCatPadrao = { tituloCatPadrao: this.listaItemCatPadrao[i].tituloCatPadrao  ,
		                              descCatPadrao: this.listaItemCatPadrao[i].descCatPadrao    ,
											duracao: this.listaItemCatPadrao[i].duracao          ,
									     prioridade: this.listaItemCatPadrao[i].prioridade       ,
								  indisponibilidade: this.listaItemCatPadrao[i].indisponibilidade	 

		                          };
            list_ItemCatPadrao.push(l_ItemCatPadrao);
		}
		
		
		let ativarContrato   = false;
		let desligarContrato = false;
		const tipoCategoria = parseInt(this.dadosCatPadrao.tipoCategoriaPadrao);
		
		if( tipoCategoria === 1 ){
			ativarContrato   = false;
			desligarContrato = false;
		}else if( tipoCategoria === 2 ){
			      ativarContrato   = true;
			      desligarContrato = false;
		}else if( tipoCategoria === 3 ){
				  ativarContrato   = false;
				  desligarContrato = true;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let dadostCategoriaPadrao = { categoria_padrao     : this.dadosCatPadrao.categoria_padrao,
			                          login_user           : this.dadosCatPadrao.login_user      ,
									  ativar_contrato      : ativarContrato                      ,
									  desligar_contrato    : desligarContrato                    ,
 	   	                              obs                  : this.dadosCatPadrao.obs             ,
 	   	                              itensCategoriaPadrao : list_ItemCatPadrao 
 	   	};  

 	   	return dadostCategoriaPadrao;     

	}

    salvarCategoriaPadraoAPI(){
		
		let dados = this.getDadosApi();
		console.log(  JSON.stringify( dados ) );
		
    	let urlBase = document.getElementById('urlAPI').value;
    	let urlAPI  = urlBase + 'SalvarCategoriaPadrao';
		let caminhoUrlPricipal = this.getContextPath() + "/principal/telaPrincipal.jsp";

		this.showLoading();	

		$.ajax({
			method : "POST",
//			url    : "http://localhost:8090/PortalMudanca/SalvarCategoriaPadrao",
			url    : urlAPI,
			data   : JSON.stringify(dados),
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				 $("#box_dark").css('display','none');
//				 document.getElementById("btSalvarGMUDNormal").disabled = true;
				 
				 Swal.fire({
				   title: "Cadastro Categoria Padrão",
				   text : "Categoria Padrão( "+ response.categoria_padrao +" )cadastrada com sucesso!",
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
				    title : "Salvar Categoria Padrão"                       ,
				    text  : "Erro ao salvar Categoria Padrão: " + xhr.responseText ,
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


var categoriaPadraoClass = new CategoriaPadrao() 