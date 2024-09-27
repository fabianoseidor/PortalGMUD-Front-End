/**
 * 
 */

 function formatDuracao( duracao ) { 
	let tam = duracao.length;
	let durFort = '';
	for( let i = 0; i < tam; i++ ){
		let min = duracao[i].toString();
		
		if( min.length === 1 ) min = '0' + min;
		durFort = durFort + min;
		if( i < ( tam -1 ) )durFort = durFort + ':';
	   }
	return durFort;

 }
 
 async function formatDataStr( data ) {
	let tam    = data.length;
	let dtFort;
	   
	if( tam === 5 ){
		dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
	}	else if( tam === 7 ){
			dtFort = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' +data[5];
	}else dtFort = data;
	
	return dtFort;

 }

 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/
 async function getResponsavelTarefa(){
     let urlBase = document.getElementById('urlAPI').value;
     let urlAPI  = urlBase + 'listaResponsavelAtividade';
     const l_ResponsavelCliente = await fetch(urlAPI).then(response => response.json());
     return l_ResponsavelCliente;
 }
 
 /******************************************************************/
 /*                                                                */
 /*                                                                */
 /******************************************************************/
 async function funcUpdateResponsavelAtivade( idSelect, idAtividadeMudanca, loginUser, modal ){
	
  let idResponsavel  = document.getElementById(idSelect).value;
  let nomeResponsavel = $('#'+idSelect).find ( ":selected").text( );
  

  let urlBase = document.getElementById('urlAPI').value;
  let urlAPI  = urlBase + 'mudarResponsavelAtividade/' + idAtividadeMudanca + '/' + idResponsavel + '/' + nomeResponsavel + '/' + loginUser;

  const r_updadeRespons = await fetch( urlAPI, { method : 'POST',
                                                 headers: { 'Content-Type': 'application/json; charset=utf-8' }
 			                                   }).then(response => response.text())
 			                                     .then(body => { return body; });
												 
												 
  let msg = "";
    if( r_updadeRespons === 'sucesso' ){
		getTabelaHistoriico( idAtividadeMudanca );
        msg = "Update Responsável Atividade para " + nomeResponsavel + ", realizado com Sucesso!";
        MensagemConfimacaoModal( "success","Update Responsável Atividade", msg, modal );
    }else {
       msg = "ERRO: Update Responsável Atividade para " + nomeResponsavel + "!";
       MensagemConfimacaoModal( "error","Update Responsável Atividade", msg, modal );
    }     
 } 

 async function listaTabelaTarefa( tarefas/*, loginUser */ ){
	let tbody = document.getElementById('tbTarefasModal');	
	tbody.innerText = '';
/*	
	let l_r_Cliente = await getResponsavelTarefa();
	let userLogado = document.getElementById('UserLogado').value;
*/	
	for(let i = 0; i < tarefas.length; i++){
		
		let tr = tbody.insertRow();
/*
		var idSelect = "id_select_"+i;
		let valorSelect = "";
		        
		if( tarefas[i].dt_inicio_tarefa !== null || userLogado !== loginUser ){
		    const nomeResp   = tarefas[i].responsavelAtividade.responsavel_atividade;			                   
		    const idNomeResp = tarefas[i].responsavelAtividade.id_responsavel_atividade;			
			
		    let   msn        = "";
		    if( userLogado !== loginUser )
		    	msn = 'Somente o Owner da GMUD poderá alterar o executor da tarefa!';
		    else msn = 'Não é possível alterar o responsável desta tarefa, pois já foi iniciada pelo usuário "' + nomeResp + '"!';
			
			valorSelect  ="<td style=\"vertical-align: middle;>";
			valorSelect += " <select class=\"form-control\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + msn + "\" id=\"" + idSelect + "\" >";
			valorSelect += "<option value=" + idNomeResp + " selected disabled>" + nomeResp + "</option>"; 
			valorSelect += " </select>  </td>";
		}else{
			valorSelect  = "<td style=\"vertical-align: middle;\"> ";
		    valorSelect += " <select  class=\"form-control\" id=\"" + idSelect + "\" onchange=\"funcUpdateResponsavelAtivade('" + idSelect + "', "  + tarefas[i].id_atividade_mudanca + ", '" + loginUser + "' )\">";
		    for(let j = 0; j < l_r_Cliente.length; j++){
		        if( tarefas[i].responsavelAtividade.id_responsavel_atividade === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
		        else selected = "";	
		        valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
		    }
		    valorSelect += " </select> </td>";	
		}			
*/
		let td_idTarefa                  = tr.insertCell();
		let td_carregar                  = tr.insertCell();
        let td_tituloTarefaShow          = tr.insertCell();
        let td_dataTarefaShow            = tr.insertCell();
        let td_duracaoTarefaShow         = tr.insertCell();
		let td_prioridadefa              = tr.insertCell();
        let td_descricaoTarefaShow       = tr.insertCell();
        let td_nomeResponsavelTarefaShow = tr.insertCell();
        let td_dataInicioTarefaShow      = tr.insertCell();
        let td_dataFimTarefaShow         = tr.insertCell();		

		let duracaoFort = ' - ';
		if( tarefas[i].duracao !== undefined )
		    duracaoFort = formatDuracao( tarefas[i].duracao );

		let dtInicioTarefa = ' - ';
		let dtFinalTarefa  = ' - '; 
		if( tarefas[i].dt_inicio_tarefa !== null  )
			dtInicioTarefa = formatDataStr( tarefas[i].dt_inicio_tarefa );
		if( tarefas[i].dt_final_tarefa !== null  )
			dtFinalTarefa = formatDataStr( tarefas[i].dt_final_tarefa );
		        
        // Inseri os valores do objeto nas celulas
		td_idTarefa.innerText                  = ( tarefas[i].id_atividade_mudanca                       !== undefined ? tarefas[i].id_atividade_mudanca                       : -1 );
        td_tituloTarefaShow.innerText          = ( tarefas[i].titulo_atividade_mudanca                   !== undefined ? tarefas[i].titulo_atividade_mudanca                   : '' );
        td_dataTarefaShow.innerText            = ( tarefas[i].dt_tarefa                                  !== undefined ? formatData( 1, tarefas[i].dt_tarefa )                 : '' );
		td_duracaoTarefaShow.innerText         = ( duracaoFort                                           == ' - '      ? duracaoFort                                           : duracaoFort    );
		td_prioridadefa.innerText              = ( tarefas[i].prioridade                                 !== undefined ? tarefas[i].prioridade                                 : ''             );
		td_descricaoTarefaShow.innerText       = ( tarefas[i].atividade_mudanca                          !== undefined ? tarefas[i].atividade_mudanca                          : ''             );
		td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].responsavelAtividade.responsavel_atividade !== undefined ? tarefas[i].responsavelAtividade.responsavel_atividade : ''             );
		td_dataInicioTarefaShow.innerText      = ( dtInicioTarefa                                        !== ' - ' ? formatData( 2, dtInicioTarefa )                           : dtInicioTarefa );
		td_dataFimTarefaShow.innerText         = ( dtFinalTarefa                                         !== ' - ' ? formatData( 2, dtFinalTarefa  )                           : dtFinalTarefa  );
//		td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.

        let imgcarregar = document.createElement('img');
        imgcarregar.src = this.getContextPath() +'/imagens/mostrar-propriedade.-48.png';
        imgcarregar.setAttribute('onclick','getTarefa( ' +  tarefas[i].id_atividade_mudanca + ' )');
		imgcarregar.setAttribute('style', 'cursor:pointer;' );
        imgcarregar.setAttribute('data-toggle'   , 'tooltip'            );
        imgcarregar.setAttribute('data-placement', 'top'                );
        imgcarregar.setAttribute('title'         , 'Visualizar Tarefa!' ); 
		td_carregar.appendChild(imgcarregar);
		td_carregar.classList.add('center');
       
        if( tarefas[i].dt_inicio_tarefa === null ) td_dataInicioTarefaShow.classList.add('center');
        if( tarefas[i].dt_final_tarefa  === null ) td_dataFimTarefaShow.classList.add('center');

		td_carregar.setAttribute                 ('style', 'vertical-align: middle' );
		td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
		td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
		td_prioridadefa.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
		td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
		td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle; text-align:center' );
		td_dataInicioTarefaShow.setAttribute     ('style', 'vertical-align: middle' );
		td_dataFimTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		
		td_idTarefa.setAttribute        ('style', 'display:none' );
    }
}


function tabelaTrasfResponcabilidade(  ){
   var tabelaResposTarefa = document.getElementById( 'tabelaTarefasModalTrocaResponse' ),rIndex;
   for( var i = 0; i < tabelaResposTarefa.rows.length; i++  ){
        tabelaResposTarefa.rows[i].onclick = function(){
           rIndex = this.rowIndex;
    //       console.log( rIndex + ' - ' + this.cells[0].innerHTML + ' - ' + this.cells[2].innerHTML + ' - ' + $('#id_select_'+ (rIndex-1) ).find ( ":selected").text( ) );
		   if( rIndex !== 0 ) getTabelaHistoriico( this.cells[0].innerHTML );
        }
   }
}

 async function getTabelaHistoriico( idTarefa ){
	let urlBase = document.getElementById('urlAPI').value;
	let urlAPI  = urlBase + 'buscarHistoricoTranIdTarefa/' + idTarefa;
	const r_historico = await fetch( urlAPI, { method : 'GET', headers: { 'Content-Type': 'application/json; charset=utf-8' } }).then(response => response.text());
	
	if( r_historico !== null ){
		montaTabelaHistoriico( r_historico )
    }else{
		let tbody = document.getElementById('tbTarefasHistorico');	
		tbody.innerText = '';

	}
	
 }
 
 async function montaTabelaHistoriico( v_historico ){
	
	const l_historico = JSON.parse( v_historico );
	
	let tbody = document.getElementById('tbTarefasHistorico');	
	tbody.innerText = '';
	for(let i = 0; i < l_historico.length; i++){
		let tr = tbody.insertRow();
		
		let td_idTarefa       = tr.insertCell();
		let td_idRespOrgem    = tr.insertCell();
		let td_nomeRespOrigem = tr.insertCell();
		let td_idRespDest     = tr.insertCell();
		let td_nomeRespDest   = tr.insertCell();
		let td_DdataHist      = tr.insertCell();
		let td_login          = tr.insertCell();
		
		let dtAlteracao = '';
		if( l_historico[i].dt_criacao !== null  ){
			let data = l_historico[i].dt_criacao;
			let tam  = data.length;
           
			if( tam === 5 ){
				dtAlteracao = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' + '00';
			}else if( tam === 7 || tam === 6){
					dtAlteracao = data[0] + '-' + data[1] + '-' + data[2] + ' ' + data[3] + ':' + data[4] + ':' +data[5];
			}else dtAlteracao = data;
        }
		
		td_idTarefa.innerText       = ( l_historico[i].id_tarefa              !== undefined ? l_historico[i].id_tarefa              : ' - ' );
		td_idRespOrgem.innerText    = ( l_historico[i].id_responsavel_origem  !== undefined ? l_historico[i].id_responsavel_origem  : ' - ' );
		td_nomeRespOrigem.innerText = ( l_historico[i].nome_user_origem       !== undefined ? l_historico[i].nome_user_origem       : ' - ' );
		td_idRespDest.innerText     = ( l_historico[i].id_responsavel_destino !== undefined ? l_historico[i].id_responsavel_destino : ' - ' );
		td_nomeRespDest.innerText   = ( l_historico[i].nome_user_destino      !== undefined ? l_historico[i].nome_user_destino      : ' - ' );
		td_DdataHist.innerText      = ( l_historico[i].dt_criacao             !== undefined ? formatData( 2, dtAlteracao )          : ' - ' );
		td_login.innerText          = ( l_historico[i].login_user             !== undefined ? l_historico[i].login_user             : ' - ' );
		
		
		td_idTarefa.setAttribute      ('style', 'vertical-align: middle; text-align:center' );
		td_idRespOrgem.setAttribute   ('style', 'vertical-align: middle; text-align:center' );
		td_idRespDest.setAttribute    ('style', 'vertical-align: middle; text-align:center' );
		td_nomeRespOrigem.setAttribute('style', 'vertical-align: middle' );
		td_nomeRespDest.setAttribute  ('style', 'vertical-align: middle' );
		td_DdataHist.setAttribute     ('style', 'vertical-align: middle' );
		td_login.setAttribute         ('style', 'vertical-align: middle' );
	}
	
 }

 async function listaTabelaTarefaTRT( tarefas, loginUser ){
	let tbody = document.getElementById('tbTarefasModalTrocaResponse');	
	tbody.innerText = '';
	
	let l_r_Cliente = await getResponsavelTarefa();
	let userLogado = document.getElementById('UserLogado').value;
	
	for(let i = 0; i < tarefas.length; i++){
		
		let tr = tbody.insertRow();

		var idSelect = "id_select_"+i;
		let valorSelect = "";
		        
		if( tarefas[i].dt_inicio_tarefa !== null || userLogado !== loginUser ){
		    const nomeResp   = tarefas[i].responsavelAtividade.responsavel_atividade;			                   
		    const idNomeResp = tarefas[i].responsavelAtividade.id_responsavel_atividade;			
			
		    let   msn        = "";
		    if( userLogado !== loginUser )
		    	msn = 'Somente o Owner da GMUD poderá alterar o executor da tarefa!';
		    else msn = 'Não é possível alterar o responsável desta tarefa, pois já foi iniciada pelo usuário "' + nomeResp + '"!';
			
			valorSelect  ="<td style=\"vertical-align: middle;>";
			valorSelect += " <select class=\"form-control\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + msn + "\" id=\"" + idSelect + "\" >";
			valorSelect += "<option value=" + idNomeResp + " selected disabled>" + nomeResp + "</option>"; 
			valorSelect += " </select>  </td>";
		}else{
			valorSelect  = "<td style=\"vertical-align: middle;\"> ";
		    valorSelect += " <select  class=\"form-control\" id=\"" + idSelect + "\" onchange=\"funcUpdateResponsavelAtivade('" + idSelect + "', "  + tarefas[i].id_atividade_mudanca + ", '" + loginUser + "', 'modalTrasnferenciaTarefa' )\">";
		    for(let j = 0; j < l_r_Cliente.length; j++){
		        if( tarefas[i].responsavelAtividade.id_responsavel_atividade === l_r_Cliente[j].id_responsavel_atividade ) selected = " selected ";
		        else selected = "";	
		        valorSelect += "<option value=" + l_r_Cliente[j].id_responsavel_atividade + " " + selected + ">" + l_r_Cliente[j].responsavel_atividade + "</option>"; 
		    }
		    valorSelect += " </select> </td>";	
		}			

		let td_idTarefa                  = tr.insertCell();
        let td_tituloTarefaShow          = tr.insertCell();
        let td_dataTarefaShow            = tr.insertCell();
        let td_duracaoTarefaShow         = tr.insertCell();
		let td_prioridadefa              = tr.insertCell();
        let td_descricaoTarefaShow       = tr.insertCell();
        let td_nomeResponsavelTarefaShow = tr.insertCell();
        let td_dataInicioTarefaShow      = tr.insertCell();
        let td_dataFimTarefaShow         = tr.insertCell();		

		let duracaoFort = ' - ';
		if( tarefas[i].duracao !== undefined )
		    duracaoFort = formatDuracao( tarefas[i].duracao );

		let dtInicioTarefa = ' - ';
		let dtFinalTarefa  = ' - '; 
		if( tarefas[i].dt_inicio_tarefa !== null  )
			dtInicioTarefa = await formatDataStr( tarefas[i].dt_inicio_tarefa );
		if( tarefas[i].dt_final_tarefa !== null  )
			dtFinalTarefa = await formatDataStr( tarefas[i].dt_final_tarefa );
		        
        // Inseri os valores do objeto nas celulas
		td_idTarefa.innerText                  = ( tarefas[i].id_atividade_mudanca                       !== undefined ? tarefas[i].id_atividade_mudanca                       : -1 );
        td_tituloTarefaShow.innerText          = ( tarefas[i].titulo_atividade_mudanca                   !== undefined ? tarefas[i].titulo_atividade_mudanca                   : '' );
        td_dataTarefaShow.innerText            = ( tarefas[i].dt_tarefa                                  !== undefined ? formatData( 1, tarefas[i].dt_tarefa )                 : '' );
		td_duracaoTarefaShow.innerText         = ( duracaoFort                                           == ' - '      ? duracaoFort                                           : duracaoFort    );
		td_prioridadefa.innerText              = ( tarefas[i].prioridade                                 !== undefined ? tarefas[i].prioridade                                 : ''             );
		td_descricaoTarefaShow.innerText       = ( tarefas[i].atividade_mudanca                          !== undefined ? tarefas[i].atividade_mudanca                          : ''             );
//		td_nomeResponsavelTarefaShow.innerText = ( tarefas[i].responsavelAtividade.responsavel_atividade !== undefined ? tarefas[i].responsavelAtividade.responsavel_atividade : ''             );
		td_dataInicioTarefaShow.innerText      = ( dtInicioTarefa                                        !== ' - ' ? formatData( 2, dtInicioTarefa )                           : dtInicioTarefa );
		td_dataFimTarefaShow.innerText         = ( dtFinalTarefa                                         !== ' - ' ? formatData( 2, dtFinalTarefa  )                           : dtFinalTarefa  );
		td_nomeResponsavelTarefaShow.outerHTML = valorSelect; // Selecte de Responsavel pela Tarefa, caso seja necess'ario alterar.

       
        if( tarefas[i].dt_inicio_tarefa === null ) td_dataInicioTarefaShow.classList.add('center');
        if( tarefas[i].dt_final_tarefa  === null ) td_dataFimTarefaShow.classList.add('center');

		td_tituloTarefaShow.setAttribute         ('style', 'vertical-align: middle' );
		td_dataTarefaShow.setAttribute           ('style', 'vertical-align: middle' );
		td_prioridadefa.setAttribute             ('style', 'vertical-align: middle; text-align:center' );
		td_duracaoTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		td_descricaoTarefaShow.setAttribute      ('style', 'vertical-align: middle' );
		td_nomeResponsavelTarefaShow.setAttribute('style', 'vertical-align: middle; text-align:center' );
		td_dataInicioTarefaShow.setAttribute     ('style', 'vertical-align: middle' );
		td_dataFimTarefaShow.setAttribute        ('style', 'vertical-align: middle' );
		
		td_idTarefa.setAttribute        ('style', 'display:none' );
    }
	
	
	tabelaTrasfResponcabilidade();
	
}


function getTarefaPorIdGMUD( urlBase, idMudanca, loginUser ){
		
	let urlAPI = urlBase + "obterListaAtividadeMudanca/" + idMudanca;

	$.ajax({
		method     : "GET"                             ,
		url        : urlAPI                            ,
		contentType: "application/json; charset=utf-8" ,
		beforeSend: function( xhr ) {
		   showLoading();
		},
		success    : function(response) {
			// console.log( "length: " + response.length );
			
			if( response.error !== undefined ){
			    MensagemConfimacaoModal( "warning", "Executa Tarefa", response.error, "modalExecucaoTarefaGMUD" );
		    }else{				
				listaTabelaTarefa   ( response/*, loginUser*/ );
				listaTabelaTarefaTRT( response, loginUser );
		    }
			hideLoading();
			limpaModal();
			$("#modalExecucaoTarefaGMUD").modal();
		}
	}).fail(function(xhr, status, errorThrown) {
		// alert("Erro ao Listar Mudanças: " + xhr.responseText);
		hideLoading();
		MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Listar Mudanças po ID: " + xhr.responseText, "modalExecucaoTarefaGMUD" ) ;
	});
}

  function finalizarTarefa( ){

	let idTarafaInici = document.getElementById( 'idTarefaAux' ).value; 
	let idMudInici    = document.getElementById( 'idMudancaAux').value; 
	let reportFinalF  = document.getElementById( 'reportFinal' ).value; 
	let loginRes      = document.getElementById( 'loginResponsavelTarefa'  ).value; 
	
	if( reportFinalF.trim() == ''){ 
		
		MensagemConfimacaoModal("warning","Finalizar Tarefa", "Favor preencher o Report Final!", "modalExecucaoTarefaGMUD");
		return false;
	}
		
	let urlBase = document.getElementById('urlAPI').value;
//    let urlAPI  = urlBase + 'finalizaTarefa/';
	let urlAPI  = urlBase + 'finalizaTarefaBody';

	let dados = {
			idAtividadeMudanca : idTarafaInici,
			reportFinal        : reportFinalF                             
	};  
			
		$.ajax({
			method : "POST",
//			url : "http://localhost:8090/PortalMudanca/finalizaTarefa/" + idTarafaInici + "/" + reportFinalF,
//			url : urlAPI + idTarafaInici + "/" + reportFinalF,
            url         : urlAPI                           ,
			contentType : "application/json; charset=utf-8"  ,
			data        : JSON.stringify(dados)            ,
			beforeSend  : function( xhr ) {
				   showLoading();
				},
			success : function(response) {
				hideLoading();
//				console.log("response: " + response);
				
				let msg = "";
				if( response === 'sucesso' ){
					msg = "Tarefa " + idTarafaInici + ", Finalizar com Sucesso!";
				    MensagemConfimacaoModal("success","Finalizar Tarefa", msg, "modalExecucaoTarefaGMUD");
				    getListaTarefa( idMudInici );
		      		validaBotoesTarefa( true, true, loginRes );
				}else 
					if( response === 'TAREFA_NAO_INICIADA' ){
						msg = "A Tarefa " + idTarafaInici + " não Inicializada! Ela só podera ser finalizada, após ser iniciada e executada!";
						MensagemConfimacaoModal("error","Finalizar Tarefa", msg, "modalExecucaoTarefaGMUD");
				}
				else{
					msg = "ERRO: Ao Finalizar Tarefa " + idTarafaInici + "!";
					MensagemConfimacaoModal("error","Finalizar Tarefa", msg, "modalExecucaoTarefaGMUD");
	            }
				
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Inicialização de Tarefas: " + xhr.responseText);
			hideLoading();
//			MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Finalizar de Tarefas: " + xhr.responseText, "modalExecucaoTarefaGMUD") ;
			if (xhr.status == 500){
	            var answer = xhr.responseText; //adiciona o que foi carregado a uma variável
	            var patients = JSON.parse(answer); //converte o que foi carregado para um objeto javascript
//		        alert(  patients.status + ' - '+ patients.message + ' - '+ patients.path + ' - '+ patients.error )
				let msnErro = 'Erro ao Finalizar de Tarefas: ' + patients.status + ' / Mensagem erro: ' + patients.message;
				Swal.fire({
							icon  : "error"        ,
							title : patients.error ,
							text  : msnErro        ,
							target: document.getElementById("modalExecucaoTarefaGMUD"),
						  });
			}else{
				Swal.fire({
				    icon  : "error"                             ,
				    title : "Salvar GMUD"                       ,
				    text  : "Erro ao salvar GMUD: " + xhr.responseText ,
					target: document.getElementById("modalExecucaoTarefaGMUD"),
				    }
				);
			}
		});
		
  }

    function getListaTarefa( idMudancaTarefa ){
  		let urlBase = document.getElementById('urlAPI').value;
  	    let urlAPI  = urlBase + 'obterListaAtividadeMudanca/';

  		$.ajax({
  			method : "GET",
  //			url : "http://localhost:8090/PortalMudanca/obterListaAtividadeMudanca/" + idMudancaTarefa,
  			url : urlAPI + idMudancaTarefa,
  			contentType : "application/json; charset=utf-8",
  			beforeSend: function( xhr ) {
  				   showLoading();
  				},
  			success : function(response) {
  //				console.log("response: " + response);
  				
  				if( response.error !== undefined ){
  				    MensagemConfimacaoModal("error", "Pesquisa Tarefa: ", response.error, "modalExecucaoTarefaGMUD");			    
  			    }else{
  			    	listaTabelaTarefa   ( response/*, response.login_user */ ); 
					listaTabelaTarefaTRT( response, response.login_user );
  			    }
  				hideLoading();
  			}
  		}).fail(function(xhr, status, errorThrown) {
  			// alert("Erro ao Listar Tarefas: " + xhr.responseText);
  			hideLoading();
  			MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Listar Tarefas: " + xhr.responseText, "modalExecucaoTarefaGMUD");
  		});
    }
	
	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	async function checkPrioridadeTarefa( idMudanca, idTarefa ) {
		try {
			let urlBase       = document.getElementById('urlAPI').value;
			let urlAPI  = urlBase + 'checkPrioridadeTarefas/' + idMudanca + '/' +idTarefa ;	
			const checkReturn = await fetch(urlAPI).then(response => response.json());
			
			return checkReturn;
		} catch (error) {
			 hideLoading();
			 MensagemConfimacaoModal( "error", "Tarefas", "Erro ao Inicialização de Tarefas: " + xhr.responseText, "modalExecucaoTarefaGMUD" ) ;
		}
	}

	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	async function iniciarTarefa( ) {
		try {
			 showLoading();
			 let idTarafaInici = document.getElementById( 'idTarefaAux' ).value; 
			 let idMudInici    = document.getElementById( 'idMudancaAux').value; 
			 let loginRes      = document.getElementById( 'loginResponsavelTarefa'  ).value; 
			 const checkReturn = await checkPrioridadeTarefa( idMudInici, idTarafaInici )
			 if( !checkReturn ) throw 'Existe tarefas com "Prioridade" menor, que não foram finalizadas. Favor executá-las primeiro que esta!';
			
			 let urlBase          = document.getElementById('urlAPI').value;
			 let urlAPI           = urlBase + 'inicializaTarefa/';
			 const r_IniciarTarefa = await fetch(urlAPI + idTarafaInici, {
			   	                                               method : 'POST',
			   	                                               headers: { 'Content-Type': 'application/json; charset=utf-8' }
			   	                          }).then(response => response.text())
			   	                            .then(body => { return body; });
			 let msg = "";
			 if( r_IniciarTarefa === 'sucesso' ){
			     msg = "Tarefa " + idTarafaInici + ", Inicializada com Sucesso!";
				 MensagemConfimacaoModal("success","Inicializacao de Tarefas", msg, "modalExecucaoTarefaGMUD");
				 getListaTarefa( idMudInici );
				 await validaBotoesTarefa( true, false, loginRes );
			 }else {
				msg = "ERRO: Ao Inicializada Tarefa " + id + "!";
				MensagemConfimacaoModal("error","Inicializacao de Tarefas", msg, "modalExecucaoTarefaGMUD");
			 }
			 
			 hideLoading();
			 
		} catch (error) {
			 hideLoading();
			 MensagemConfimacaoModal( "error", "Tarefas",  error, "modalExecucaoTarefaGMUD" );
		 }
	}

  function limpaModal(){
	$('#idTarefaAux'           ).val( '' );
	$('#idMudancaAux'          ).val( '' );
	$('#idResponsavelTarefa'   ).val( '' );
	$('#nomeResponsavelTarefa' ).val( '' );
	$('#emailResponsavelTarefa').val( '' );
	$('#tituloTarefa'          ).val( '' );
	$('#dataTarefa'            ).val( '' );
	$('#duracaoTarefa'         ).val( '' );
	$('#descricaoTarefa'       ).val( '' );
	$('#reportFinal'           ).val( '' );
	$('#loginResponsavelTarefa').val( '' );
	

	$('#btFinalizar'    ).attr('disabled', true);
	$('#reportFinal'    ).attr('disabled', true);
	$('#btIniciar'      ).attr('disabled', true);
  }
  
  function getTarefa( idTarefa ) {
		let urlBase = document.getElementById('urlAPI').value;
	    let urlAPI  = urlBase + 'obterPorIdAtividadeMudanca/';
	  
		$.ajax({
			method     : "GET"                             ,
//			url        : "http://localhost:8090/PortalMudanca/obterPorIdAtividadeMudanca/"+ idTarefa                            ,
			url        : urlAPI + idTarefa                 ,
			contentType: "application/json; charset=utf-8" ,
			beforeSend: function( xhr ) {
				   showLoading();
				},
			success    : function(response) {
				// console.log( "length: " + response.length );
				
				if( response.error !== undefined ){
					MensagemConfimacaoModal("error","Pesquisa Tarefas", msg, "modalExecucaoTarefaGMUD");
			    }else{
			    	$('#idTarefaAux'           ).val( response.id_atividade_mudanca                            );
			    	$('#idMudancaAux'          ).val( response.mudanca.id_mudanca                              );
			    	$('#idResponsavelTarefa'   ).val( response.responsavelAtividade.id_responsavel_atividade   );
			    	$('#nomeResponsavelTarefa' ).val( response.responsavelAtividade.responsavel_atividade      );
			    	$('#emailResponsavelTarefa').val( response.responsavelAtividade.email_responsavel_atividade);
			    	$('#tituloTarefa'          ).val( response.titulo_atividade_mudanca                        );
			    	$('#dataTarefa'            ).val( formatData( 1,response.dt_tarefa)                        );
			    	$('#duracaoTarefa'         ).val( response.duracao                                         );
			    	$('#descricaoTarefa'       ).val( response.atividade_mudanca                               );
			    	$('#reportFinal'           ).val( response.report_final                                    );
					$('#loginResponsavelTarefa').val( response.responsavelAtividade.login_responsavel_atividade);

		    		$('#btFinalizar'    ).attr('disabled', true);
		    		$('#reportFinal'    ).attr('disabled', true);
		    		$('#btIniciar'      ).attr('disabled', true);
					
					/// Valida botoes de inico e fim de tarefa
					if(  response.dt_inicio_tarefa === null && response.dt_final_tarefa === null )
						validaBotoesTarefa( false, true, response.responsavelAtividade.login_responsavel_atividade );
					else 
					  if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa === null )
						  validaBotoesTarefa( true, false, response.responsavelAtividade.login_responsavel_atividade );
					  else 
						if( response.dt_inicio_tarefa !== null && response.dt_final_tarefa !== null )
							 validaBotoesTarefa( true, true, response.responsavelAtividade.login_responsavel_atividade );
		             
			    }
				hideLoading();
			}
		}).fail(function(xhr, status, errorThrown) {
			// alert("Erro ao Listar Mudanças: " + xhr.responseText);
			hideLoading();			
			MensagemConfimacaoModal("error","Tarefas", "Erro ao Listar Mudanças: " + xhr.responseText, "modalExecucaoTarefaGMUD");
		});		
 
  }
  
  async function validaBotoesTarefa( checkInicia, checkFinaliza, loginResponsavelAtividade ) {
    
    let userLogado = document.getElementById('UserLogado').value;
    
    $( '#btIniciar'  ).attr('disabled', checkInicia  );
    $( '#reportFinal').attr('disabled', checkFinaliza);
    $( '#btFinalizar').attr('disabled', checkFinaliza);

    if( userLogado !== loginResponsavelAtividade ){
  		$('#btFinalizar'    ).attr('disabled', true);
  		$('#reportFinal'    ).attr('disabled', true);
  		$('#btIniciar'      ).attr('disabled', true);
  		
  		$('#btIniciar'      ).attr("title","Esta tarefa só poderá ser iniciada pelo Responsável por ela!");			    		
  		$('#btFinalizar'    ).attr("title","Esta tarefa só poderá ser finalizada pelo Responsável por ela!");
      }else{
  		$('#btIniciar').attr("title","Iniciar tarefa!");
  		if( !checkFinaliza ) $('#btFinalizar').attr("title","Finalizar tarefa!");
      }
  }
  
  function formatData( tipo, data ) {
  	const dataCriada = new Date(data);
  	let dataFormatada;
  //		
      if( tipo === 1){
          dataFormatada = dataCriada.toLocaleDateString('pt-BR', {timeZone: 'UTC',}); // Saida: 21/08/1988
      }else{
  	    dataFormatada = dataCriada.toLocaleString('pt-BR', { timezone: 'UTC' }); // Saida: 20/10/2023 07:11:08
      }
  	return dataFormatada;
    }

  function MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
	// icon
//		  	"warning"
//		  	"error"
//		  	"success"
//		  	"info"

			  Swal.fire({
				    icon  : iconi                             ,
				    title : tituloPrincipal                   ,
				    text  : textoPrincipal                    ,
				    }
				);
			
	}

	function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
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
	
   function showLoading(){
	 $("#box_dark").css('display','flex');
   }
   function hideLoading(){
     $("#box_dark").css('display','none');
   }

				